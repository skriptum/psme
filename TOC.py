import os

dirs_sem1 = {
    "metrics": "Metrics",
    "macro": "Macro",
    "micro": "Micro",
    "growth": "Growth",
}

with open(".gitignore") as f:
    ignores = f.read().splitlines()

ignores.append([
    "SUMMARY.md",
    "TOC.py",
    # "README.md",
    "_images",
    "LICENSE.md",
    ])

#%%
# get all files in the directory and subdirectories with type {dirname : filenames}
result_list = ["root: README", "subtrees:"] # first two lines of the SUMMARY.md

result_list.append(f"""
- caption: "Semester 1"    
  hidden: True
  maxdepth: 1
  titlesonly: True
  entries:
""")

for dir in dirs_sem1.keys():
    result_list.append(f"""
    - file: {dir}/README
      title: "{dirs_sem1[dir]}"
      entries:
    """)

    for file in sorted(os.listdir(dir)):
        if file == "README.md":
            # dont add the README to the list
            pass

        elif file not in ignores:
            if file[-3:] == ".md": # only add markdown files, not directories
                date = file[:10]
                date = date.replace("-", "/")
                filename = file[11:-3]
                filename = filename.replace("_", " ")
                filename = filename.replace("-", " ")

                # add the file to the list

                result_list.append(f"      - file: {dir}/{file}")
                result_list.append(f"        title: {filename} [{date}] ")


with open("_toc.yml", "w") as f:
    f.writelines(line + '\n' for line in result_list)
    print("TOC updated")