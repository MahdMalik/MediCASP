from flask import Flask, request, jsonify
from flask_cors import CORS
import os
import subprocess


app = Flask(__name__)
CORS(app)  # Enable CORS for all routes


@app.route('/api/backend', methods=['POST'])
def process_data():
    queryPhrase = request.get_json()
    file_path = ""
    fileToCall = ""
    if(queryPhrase.find("autism") != -1):
        file_path = "C:/Users/mahd/Documents/MediCASP/autism.pl"
        fileToCall = "autism.pl"
    elif(queryPhrase.find("dementia") != -1):
        file_path = "C:/Users/mahd/Documents/MediCASP/dementia.pl"
        fileToCall = "dementia.pl"
    elif(queryPhrase.find("has_ra") != -1):
        file_path = "C:/Users/mahd/Documents/MediCASP/arthritis.pl"
        fileToCall = "arthritis.pl"
    elif(queryPhrase.find("has_copd") != -1):
        file_path = "C:/Users/mahd/Documents/MediCASP/copd.pl"
        fileToCall = "copd.pl"
    elif(queryPhrase.find("has_hyper_hypo_tension") != -1):
        file_path = "C:/Users/mahd/Documents/MediCASP/hypertension.pl"
        fileToCall = "hypertension.pl"
    elif(queryPhrase.find("has_hypoglycemia") != -1):
        file_path = "C:/Users/mahd/Documents/MediCASP/hypoglycemia.pl"
        fileToCall = "hypoglycemia.pl"
    elif(queryPhrase.find("has_pneumonia") != -1):
        file_path = "C:/Users/mahd/Documents/MediCASP/pneumonia.pl"
        fileToCall = "pneumonia.pl"
    # Open the file in append mode ('a')
    with open(file_path, 'a') as file:
        file.write("\n?- " + queryPhrase)

    try:
        call = subprocess.Popen(
            ["wsl", "/home/mahd/.ciao/build/bin/scasp",  fileToCall], stdin=subprocess.PIPE, stdout=subprocess.PIPE, 
            text=True, universal_newlines=True
            )
        output, err = call.communicate(timeout=10800)
        
        return jsonify(output)
    except Exception as e:
        return jsonify("error is: " + str(e))

    
if __name__ == '__main__':
    app.run(debug=True)