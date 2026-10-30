import json
from http.server import BaseHTTPRequestHandler, HTTPServer


class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path != "/test":
            self.send_error(404, "Not Found")
            return

        response = {
            "success": True,
            "message": "Запрос из 1С выполнен успешно",
            "items": [
                {
                    "code": "001",
                    "name": "Тестовый товар",
                }
            ],
        }
        response_body = json.dumps(response, ensure_ascii=False).encode("utf-8")

        self.send_response(200)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(response_body)))
        self.end_headers()
        self.wfile.write(response_body)

    def log_message(self, format, *args):
        print(f"{self.address_string()} - {format % args}")


server = HTTPServer(("localhost", 3000), RequestHandler)
print("Сервер запущен: http://localhost:3000/test")

try:
    server.serve_forever()
except KeyboardInterrupt:
    print("\nСервер остановлен.")
finally:
    server.server_close()
