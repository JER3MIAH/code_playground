const Logger = require('./logger');
const logger = new Logger();


//? Register a listener
logger.on('logger', (args) => {
    console.log('Logging', args);
});

logger.log('message');