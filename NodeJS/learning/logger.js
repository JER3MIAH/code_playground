const EventEmitter = require('events');


class Logger extends EventEmitter {
    log(message) {
        console.log(message);

        //? Raise an event
        this.emit('logger', { data: 'Message from Jeremiah' });
    }
}

module.exports = Logger;