<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f6f9fc, #e0eafc);
            color: #333;
            overflow-x: hidden;
            min-height: 100vh;
            position: relative;
            background-color: #f6f9fc;
            overflow: hidden;
        }

        header {
            background: #3674b3;
            color: #fff;
            padding: 20px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
        }

        header h1 {
            margin: 0;
            font-size: 2.2em;
            letter-spacing: 1.5px;
        }

        .container {
            margin: 100px auto 20px;
            padding: 0 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 1200px;
            position: relative;
            z-index: 10;
        }

        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 800px;
            position: relative;
            animation: fadeIn 0.6s ease-out;
        }

        .form-container h2 {
            margin-top: 0;
            color: #3498db;
            font-size: 1.8em;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group textarea {
            resize: vertical;
        }

        .form-group button {
            background: #3498db;
            color: #fff;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s, transform 0.3s, box-shadow 0.3s;
            font-size: 1em;
            position: relative;
            overflow: hidden;
        }

        .form-group button:hover {
            background: #2980b9;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }

        .form-group button::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 300%;
            height: 300%;
            background: rgba(255, 255, 255, 0.2);
            transition: transform 0.5s ease;
            border-radius: 50%;
            transform: translate(-50%, -50%) scale(0);
        }

        .form-group button:hover::before {
            transform: translate(-50%, -50%) scale(1);
        }

        .footer {
            background: #3674b3;
            color: #fff;
            text-align: center;
            padding: 20px;
            position: fixed;
            width: 100%;
            bottom: 0;
            z-index: 1000;
            box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.4);
        }

        .footer p {
            margin: 0;
            font-size: 1em;
        }

        .footer a {
            color: #4cbaf6;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            color: #333;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.4);
            z-index: 2000;
            width: 90%;
            max-width: 500px;
            text-align: center;
            animation: fadeIn 0.5s ease-out;
        }

        .popup.show {
            display: block;
        }

        .popup .close {
            background: #e74c3c;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 1.2em;
            transition: background 0.3s;
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .popup .close:hover {
            background: #c0392b;
        }

        .popup h2 {
            margin: 0;
            color: #2ecc71;
            font-size: 1.6em;
        }

        .popup p {
            margin: 10px 0 0;
            font-size: 1.1em;
            color: #666;
        }

        /* Moving lines animation */
        .background-lines {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(60deg, rgba(255,255,255,0.1) 25%, transparent 25%, transparent 75%, rgba(255,255,255,0.1) 75%, rgba(255,255,255,0.1)) repeat;
            background-size: 50px 50px;
            animation: moveBackground 5s linear infinite;
            z-index: 0;
        }

        @keyframes moveBackground {
            from {
                background-position: 0 0;
            }
            to {
                background-position: 50px 50px;
            }
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
            }

            .form-group button {
                padding: 12px;
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
    <div class="background-lines"></div>
    
    <header>
        <h1>Course Registration</h1>
    </header>
    
    <div class="container">
        <div class="form-container">
            <h2>Course Registration Form</h2>
            <form id="registrationForm">
                <div class="form-group">
                    <label for="name">Full Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="course">Select Course:</label>
                    <select id="course" name="course" required>
                        <option value="" disabled selected>Select a course</option>
                        <option value="cdac-dip">Aws + DevOps</option>
                        <option value="cdac-pg">Full Stack Developement</option>
                        <option value="cdac-adm">Data Analyst</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="comments">Additional Comments:</label>
                    <textarea id="comments" name="comments" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <button type="submit">Register</button>
                </div>
            </form>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2024 Designed By Pratik Pardeshi  | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

    <div id="popup" class="popup">
        <button class="close" onclick="closePopup()">×</button>
        <h2>Success!</h2>
        <p>Your registration has been submitted successfully.</p>
    </div>

    <script>
        const form = document.getElementById('registrationForm');
        const popup = document.getElementById('popup');

        form.addEventListener('submit', function(event) {
            event.preventDefault();
            popup.classList.add('show');
            setTimeout(() => {
                popup.classList.remove('show');
            }, 3000);
        });

        function closePopup() {
            popup.classList.remove('show');
        }
    </script>
</body>
</html>
