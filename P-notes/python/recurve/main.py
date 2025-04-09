import sys
import os
import json
import pickle


def build_structure(root_path):
    structure = {"Dir": os.path.basename(root_path), "SubDir": []}

    for entry in os.listdir(root_path):
        full_path = os.path.join(root_path, entry)

        if os.path.isdir(full_path):
            structure["SubDir"].append(build_structure(full_path))
        else:
            structure["SubDir"].append({"File": entry})

    return structure


def main():
    if len(sys.argv) < 2:
        print("Usage: python script.py <root_directory>")
        return

    root_directory = sys.argv[1]

    if not os.path.isdir(root_directory):
        print("Invalid directory path.")
        return

    hierarchy = build_structure(root_directory)

    with open("struct.dat", "wb") as file:
        # json.dump(hierarchy, file, indent=4)
        pickle.dump(hierarchy, file)

    print("Directory structure saved to struct.dat")


if __name__ == "__main__":
    main()
