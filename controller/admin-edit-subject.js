const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};

exports.getEditSubjectPage = (req, res) => {
    const subjectid = req.params.id; // Get subjectid from request parameters

    const subjectSql = 'SELECT subjectid, subjectname FROM subjects WHERE subjectid = ?';
    const sectionSql = 'SELECT sectionname FROM sections';
    const teacherSql = 'SELECT id, firstname, middlename, lastname FROM teacherdetails';

    const connection = mysql.createConnection(conn);

    // Create an object to store the results
    const data = {};

    connection.connect((err) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            res.status(500).send('Internal Server Error');
            return;
        }

        // Execute both SQL queries in parallel using Promise.all
        Promise.all([
            new Promise((resolve, reject) => {
                connection.query(sectionSql, (err, sectionResults) => {
                    if (err) {
                        reject(err);
                    } else {
                        data.sections = sectionResults;
                        resolve();
                    }
                });
            }),
            new Promise((resolve, reject) => {
                connection.query(teacherSql, (err, teacherResults) => {
                    if (err) {
                        reject(err);
                    } else {
                        data.teachers = teacherResults;
                        resolve();
                    }
                });
            }),
            new Promise((resolve, reject) => {
                connection.query(subjectSql, [subjectid], (err, subjectResults) => {
                    if (err) {
                        reject(err);
                    } else {
                        data.subject = subjectResults[0]; // Assuming you expect only one record
                        resolve();
                    }
                });
            }),
        ])
            .then(() => {
                connection.end(); // Close the database connection

                // Pass the data to your EJS template and render it
                res.render('admin-edit-subject', { data });
            })
            .catch((err) => {
                console.error('Error:', err);
                res.status(500).send('Internal Server Error');
            });
    });
};

exports.postEditSubjectPage = (req, res) => {
    
    res.redirect('admin/index-subject');
};