const EventEmitter = require('events');

const emitter = new EventEmitter();

//? Register a listener
emitter.on('logger', (args) => {
    console.log('Logging', args);
});

//? Raise an event
emitter.emit('logger', { data: 'Message from Jeremiah' });