const express = require('express');
const app = express();

app.use(express.json());

const users = [
    { id: 1, name: 'Jeremiah' },
    { id: 2, name: 'John' },
    { id: 3, name: 'Smith' },
];

app.get('/', (req, res) => {
    res.send('Hello world');
});

app.get('/api/users', (req, res) => {
    res.send(users);
});

app.post('/api/users', (req, res) => {
    const user = {
        id: users.length + 1,
        name: req.body.name,
    };
    users.push(user);
    res.send(user);
});

app.get('/api/users/:id', (req, res) => {
    const user = users.find(user => user.id === parseInt(req.params.id));
    if (!user) {
        return res.status(404).send('The user with the given ID was not found')
    }
    res.send(user);
});

app.put('/api/users/:id', (req, res) => {
    const user = users.find(user => user.id === parseInt(req.params.id));
    if (!user) {
        return res.status(404).send('The user with the given ID was not found')
    }
    user.name = req.body.name;
    res.send(user);
})

app.delete('/api/users/:id', (req, res) => {
    const user = users.find(user=> user.id === parseInt(req.params.id));
    if (!user) {
        return res.status(404).send('The user with the given ID was not found')
    }
    const index = users.indexOf(user);
    users.splice(index, 1);

    res.send(user);
})

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Listening on port ${port}...`);
});
