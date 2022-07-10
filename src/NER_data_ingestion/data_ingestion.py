import argparse
import os
import shutil
from tqdm import tqdm
import logging
from src.NER_utils.common import read_yaml, create_directories
import random


STAGE = "Data Ingestion stage" ## <<< change stage name 

logging.basicConfig(
    filename=os.path.join("logs", 'running_logs.log'), 
    level=logging.INFO, 
    format="[%(asctime)s: %(levelname)s: %(module)s]: %(message)s",
    filemode="a"
    )
