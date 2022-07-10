echo [$(date)]: "START"
echo [$(date)]: "creating environment"
conda create --prefix ./env python=3.8 -y
echo [$(date)]: "activate environment"
source activate ./env
echo [$(date)]: "create folder and file structure"

for DIR in data_ingestion data_preperation data_validation model model_eval model_trainer
do 
    echo [$(date)]: "Creating", "src/NER_"$DIR 
    mkdir -p "src/NER_"$DIR # creating directories
    echo [$(date)]: "creating __init__.py inside above folders" # creating __init_.py in every folder
    touch "src/NER_"$DIR/"__init__.py"  "src/NER_"$DIR/$DIR".py" # creating .py file for each stage
    echo "from src.NER_"$DIR"."$DIR" import *" >> "src/NER_"$DIR/"__init__.py" # appending import statement in every .py

done

echo [$(date)]: "install requirements"
pip install -r requirements.txt
echo [$(date)]: "install pytorch dependency"
pip3 install torch --extra-index-url https://download.pytorch.org/whl/cu113 -q
echo [$(date)]: "END"

# to remove everything -
# rm -rf env/ .gitignore conda.yaml README.md .git/