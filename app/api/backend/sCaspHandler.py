from flask import Flask, request, jsonify
from flask_cors import CORS
import os
import subprocess


app = Flask(__name__)
CORS(app)  # Enable CORS for all routes


@app.route('/api/backend', methods=['POST'])
def process_data():
    queryPhrase = request.get_json()
    file_path = "C:/Users/mahd/Documents/MediCASP/testLogic.pl"
    # Open the file in append mode ('a')
    with open(file_path, 'a') as file:
        file.write("\n?- " + queryPhrase)

    try:
        call = subprocess.Popen(
            ["wsl", "/home/mahd/.ciao/build/bin/scasp",  "testLogic.pl"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, 
            text=True, universal_newlines=True
            )
        output, err = call.communicate(timeout=10800)
        
        return jsonify(output)
    except Exception as e:
        return jsonify("error is: " + str(e))

    
if __name__ == '__main__':
    app.run(debug=True)