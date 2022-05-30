//You need this file to start your server
const express = require ('express');
const { route } = require('./routes/examRoutes');
const app = express();

//You need this to parse json stuff, middlewares
app.use(express.json());
app.use(express.urlencoded({extended: false}));



//Here you define the routes you want for your API
app.use(require('./routes/userRoutes'));
app.use(require('./routes/teacherRoutes'));
app.use(require('./routes/courseRoutes'));
app.use(require('./routes/examRoutes'));
app.use(require('./routes/examCategoryRoutes'));

app.listen(3000);
console.log('Server is running on port 3000');

