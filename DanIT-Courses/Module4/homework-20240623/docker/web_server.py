from http.server import BaseHTTPRequestHandler, HTTPServer
import socket

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        hostname = socket.gethostname()
        self.wfile.write(hostname.encode('utf-8'))

def run_server():
    server_address = ('', 8000)
    httpd = HTTPServer(server_address, RequestHandler)
    print('Starting server on port 8000...')
    httpd.serve_forever()

if __name__ == '__main__':
    run_server()
