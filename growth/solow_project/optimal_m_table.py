import numpy as np
import pandas as pd

# Parameters
alpha = beta = 1 / 3     # output elasticities of physical and human capital
A = 0.05                 # ordinary depreciation (n + delta)
sigma = 10               # effectiveness of military spending
tau = 0.1468             # total tax share of GDP (military + education)

def income(m, z0):
    """Steady-state income, up to a constant (the savings rate cancels in the comparison)."""
    D = A + z0 * np.exp(-sigma * m)               # total depreciation incl. expected war loss
    return ((tau - m) ** beta * D ** (-(alpha + beta))) ** (1 / (1 - alpha - beta))

m_grid = np.linspace(0, tau * 0.999, 20000)       # candidate military shares

rows = []
for z0 in [0.00, 0.05, 0.10, 0.20]:
    y = income(m_grid, z0)
    m_star = m_grid[np.argmax(y)]                 # share that maximizes steady-state income
    gain = income(m_star, z0) / income(0, z0) - 1 # income at m* relative to m = 0
    rows.append({
        "Threat z0 (%)": 100 * z0,
        "Optimal military share m* (% GDP)": round(100 * m_star, 2),
        "Education spending (% GDP)": round(100 * (tau - m_star), 2),
        "Income gain vs m = 0 (%)": round(100 * gain, 1),
    })

print(pd.DataFrame(rows).to_string(index=False))
