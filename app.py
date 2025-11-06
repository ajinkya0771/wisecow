from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess

class WiseCowHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Run cowsay
        message = subprocess.getoutput("fortune | cowsay")
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(message.encode())

if __name__ == "__main__":
    print("Starting WiseCow server on port 8080...")
    server = HTTPServer(("", 8080), WiseCowHandler)
    server.serve_forever()
