import { createServer } from "http"
import { Server } from "socket.io"

const httpServer = createServer();

const io = new Server(httpServer, {});

io.on('connection', (socket) => {
    console.log(`User ${socket.id} connected`);
    socket.on('chat_message', (msg) => {
        console.log('message: ' + msg);
        io.emit('chat_message', `${socket.id.substring(0, 5)}: ${msg}`);
    });

    //? Listen for user typing
    socket.on('typing', (name) => {
        console.log(`${name} is typing...`);
        io.emit('activity', `${name} is typing...`);
    });

    socket.on('disconnect', () => {
        console.log(`User ${socket.id} disconnected`);
    });
});
httpServer.listen(3000, () => {
    console.log('listening on *:3000');
});