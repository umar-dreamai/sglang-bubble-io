from flask import Flask, jsonify
import os  # Add this import

app = Flask(__name__)

@app.route('/')
def hello_world():
    return jsonify({"message": "Hello, Heroku!"})

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))  # Heroku sets PORT env var
    app.run(host='0.0.0.0', port=port)