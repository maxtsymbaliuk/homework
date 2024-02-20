from flask import Flask, jsonify

# Create a Flask application instance
app = Flask(__name__)

# Define a route for the root URL
@app.route('/')
def hello():
    # Define a simple JSON response
    data = {
        'message': 'Hello, World, it`s MAAAAAX!'
    }
    # Return JSON response with Content-Type header set to application/json
    return jsonify(data), 200, {'Content-Type': 'application/json'}

@app.route('/healthz')
def health_check():
    # Define a simple JSON response for health check
    health_status = {
        'status': 'ok'
    }
    # Return JSON response with Content-Type header set to application/json
    return jsonify(health_status), 200, {'Content-Type': 'application/json'}

# Run the Flask application
if __name__ == '__main__':
    app.run(debug=True)
