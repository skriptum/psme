import numpy as np
import matplotlib.pyplot as plt


#%%
# 1. Parameters
ALPHA = 1 / 3      # output elasticity of physical capital
BETA = 1 / 3       # output elasticity of human capital (need ALPHA + BETA < 1)
A = 0.05           # ordinary depreciation + population growth (n + delta)
SIGMA = 10.0       # effectiveness of military spending
TAU = 0.146        # total tax share of GDP (military + education)
S = 0.20           # savings rate (only scales levels, cancels in the indices)
Z0 = 0.10          # expected yearly war loss with no military (the threat)
M_MAX = 0.12       # upper end of the plotted range (must be below TAU)



#%%
# 2. Model functions

def total_depreciation(m, z0=Z0):
    """D(m): ordinary depreciation plus the expected war loss, which falls with m."""
    return A + z0 * np.exp(-SIGMA * m)


def steady_state(m, z0=Z0):
    """
    Steady-state income, physical capital and human capital per worker.

    Setting k_dot = 0 and h_dot = 0 gives
        k* = s(1 - tau) * y / D        h* = (tau - m) * y / D
    Substituting into y = k^alpha h^beta and solving for y:
        y* = [ (s(1 - tau))^alpha * (tau - m)^beta * D^-(alpha + beta) ]^(1 / (1 - alpha - beta))
    """
    D = total_depreciation(m, z0)
    c = S * (1 - TAU)                                   # physical capital investment rate
    exponent = 1 / (1 - ALPHA - BETA)
    y = (c**ALPHA * (TAU - m)**BETA * D**(-(ALPHA + BETA)))**exponent
    k = c * y / D
    h = (TAU - m) * y / D
    return y, k, h


def optimal_m(z0=Z0, n_grid=24001):
    """
    Optimal military share: the m that maximizes steady-state income
    (consumption is proportional to income because tau and s are fixed).
    Found by scanning a fine grid, which avoids needing the Lambert W formula.
    """
    grid = np.linspace(0, TAU * 0.999, n_grid)
    y, _, _ = steady_state(grid, z0)
    return grid[np.argmax(y)]


#%%
# 3. Compute the series

m_grid = np.linspace(0, M_MAX, 241)
y, k, h = steady_state(m_grid)

# Index each series to its own value at m = 0 (first grid point)
y_idx = y / y[0] * 100
k_idx = k / k[0] * 100
h_idx = h / h[0] * 100

m_star = optimal_m()
y_star_idx = steady_state(m_star)[0] / y[0] * 100

print(f"Optimal military share m* = {m_star * 100:.2f}% of GDP")
print(f"Income at m*   : {y_star_idx:.1f} (m = 0 -> 100)")
print(f"Capital at m*  : {steady_state(m_star)[1] / k[0] * 100:.1f}")
print(f"Human capital  : {steady_state(m_star)[2] / h[0] * 100:.1f}")


#%%
# 4. Plot

fig, ax = plt.subplots(figsize=(8, 5))

# Different line styles as well as colors, so the lines stay readable in grayscale
ax.plot(m_grid * 100, y_idx, color="#2a78d6", lw=2.2, ls="-", label="Income $y^*$")
ax.plot(m_grid * 100, k_idx, color="#1baf7a", lw=2.0, ls="--", label="Physical capital $k^*$")
ax.plot(m_grid * 100, h_idx, color="#eb6834", lw=2.0, ls=":", label="Human capital $h^*$")

# Baseline: no military spending
ax.axhline(100, color="gray", lw=0.8, alpha=0.6)

# Optimal share, marked on the income curve
ax.plot(m_star * 100, y_star_idx, "o", color="#2a78d6", ms=9, mec="white", mew=1.5, zorder=5)
ax.annotate(f"optimum $m^*$ = {m_star * 100:.1f}%",
            xy=(m_star * 100, y_star_idx),
            xytext=(m_star * 100 + 0.6, y_star_idx + 12),
            arrowprops=dict(arrowstyle="-", color="gray"), fontsize=10)


ax.set_xlabel("Military share of GDP (%)")
ax.set_ylabel("Steady state, index (m = 0 → 100)")
ax.set_title(f"Steady-state outputs by military share  "
             f"(threat $z_0$ = {Z0 * 100:.0f}%, effectiveness $\\sigma$ = {SIGMA:g})")
ax.set_xlim(0, M_MAX * 100)
ax.set_ylim(bottom=0)
ax.grid(alpha=0.25)
ax.legend(frameon=False, loc="upper right")

fig.tight_layout()
fig.savefig("steady_state_outputs.png", dpi=200)
plt.show()
