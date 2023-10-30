import { Server, Socket } from "socket.io";
import { Server as HttpServer } from "http";

const initializeWebSocket = (server: HttpServer) => {
  const io = new Server(server, {
    cors: {
      origin: "*",
    },
  });

  let users: { [key: string]: any }[] = [];

  io.on("connection", (socket: Socket) => {
    console.info("A user connected Socket ID: ", socket.id);
    io.emit("connection");

    socket.on("user_connected", (data: any) => {
      io.emit("new_connected", data);
    });

    socket.on("user_logout", (data: any) => {
      io.emit("user_logout");
    });

    socket.on("notifications", (data?: any) => {
      io.emit("new_notification", data);
    });

    socket.on("new_visit", () => {
      io.emit("new_visitor");
    });

    socket.on("disconnect", (reason) => {
      console.log("User disconnected: ", reason);
      io.emit("disconnected");
    });
  });
};

export { initializeWebSocket };
