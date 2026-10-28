# Metrics Group Project

**Title:** Who pays for Adjustment? The effects of IMF bailouts on Inequality

🫠

## Idea





## Tasks

Coding

- Data Cleaning
- Models + Robustness Checks
- Graphs + Tables



Writing

- Intro + Conclusion
- Data
- Methodology
- Results
- Discussion
- (Robustness Checks)



## Quick note on the Folder Structure

This is how I often structure my econometrical projects. The numbers prefixed to the folders are to keep it in order (hopefully). I also added a `REQUIREMENTS` file to each folder stating the requirements from the project guidelines



- `01_stata` = the stata code
  - `data`  = self-explanatory
    - `raw`  = raw data
    - `processed` = processed data, after cleaning etc
  - `do` = STATA code
    - `sample.do` A sample file, with the tpyical preambles etc
      - NOTE: add your file paths required for you here, so you dont always have to copy maybe
    - `MASTER.do`: One file to run all the different ones in the end in one clean slate
  - `figures` = where our beatiful pics go
  - `tables` = for the boring regression tables
  - `logs` = graveyard for logs no one ever looks at
- `02_literature` = a folder to collect our Literature
  - `LITERATURE.sheet` a overview table of the papers we upload / read
    - add author, date published, research design, variables, and results after reading
- `03_paper` Where our final paper will develop. Still have to decide whether to do it with LaTeX / Overleaf or Word
- `04_defense` our eventual defense of our results (a problem for january I would say)



## STATA and Cloud

> **IMPORTANT:** 2 People should never work on the same .do file and .dta dataset. This just breaks everything (I was there already)

So:

- Lets split the coding part into compartmentalized tasks and files (cleaning, models, robustness, graphics)
- can adjust regarding how much work everything needs
- Always add a date / label to your exports /e.g dta outputs or smth, so we can differentiate
- in the end, we have one master do file to run all the code at once
  - so that we are sure that it also works on Abigails Computer





## Note

As per the Guidelines

> The use of AI-generated text (ChatGPT, Claude, etc.) is prohibited in the written components of the paper and your final code. All work must be the student(s)’ original work. You must include a statement in your paper describing how AI was used in data cleaning/analysis if you use it.

Lets try to adhere to this (at least for the text, idc as much about the code)



## Links (e.g to Datasets etc.)

- [PROJECT GUIDELINES](https://cours.univ-paris1.fr/pluginfile.php/2646539/mod_resource/content/2/FINAL_PROJECT_GUIDELINES.pdf)
- [Stata Cheat Sheets](https://www.stata.com/flyers/stata-cheat-sheets/) (easy way to find out commands again)