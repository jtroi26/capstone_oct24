const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};

exports.getSubjectIndexPage = (req, res) => {
    const sql = `
        SELECT s.subjectid, s.subjectname, s.sectionname, s.teacherid, td.firstname, td.middlename, td.lastname
        FROM subjects as s
        INNER JOIN teacherdetails as td ON s.teacherid = td.id where visibility = 'Visible'
    `;

    const connection = mysql.createConnection(conn);

    connection.connect((err) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            res.status(500).send('Internal Server Error');
            return;
        }

        connection.query(sql, (err, results) => {
            if (err) {
                console.error('Error:', err);
                res.status(500).send('Internal Server Error');
                return;
            }

            connection.end(); // Close the database connection

            // Pass the data to your EJS template and render it
            res.render('admin-index-subject', { data: results });
        });
    });
};

