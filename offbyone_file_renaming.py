# Insert file renaming

from pathlib import Path

DEBUG = True
DIR = "/test/"
p = Path(DIR)

if DEBUG:
    print("Debug mode on, no changes will be made")


print(f"Renaming files in {DIR}")

# Get list of files in directory DIR

# For each filename in list:
for path in p.glob("*L002*fastq.gz"):
    # get correct number
    filename = path.name
    num = filename[12:14]
    newname = p / f"Constanttext{num}_Constanttext{num}_Constanttext{num}_{filename[21:]}"
    #modify any constant text as required
    print(f" renaming {p/filename} -> {newname}")
    if DEBUG is False:
        path.rename(newname)
