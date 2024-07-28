<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My DevOps Project 6</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #1a2a6c, #b21f1f, #fdbb2d);
            color: #fff;
        }

        .container {
            text-align: center;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease;
            animation: fadeIn 1.5s ease-out;
            max-width: 800px;
            width: 90%;
            margin: 20px 0;
        }

        .container:hover {
            transform: scale(1.05);
        }

        h1 {
            font-family: 'Raleway', sans-serif;
            font-size: 3rem;
            margin-bottom: 24px;
            animation: textAppear 2s ease-out;
        }

        p {
            margin: 10px 0;
            font-size: 1.2rem;
        }

        button {
            padding: 12px 24px;
            background-color: #ff6f61;
            color: #ffffff;
            border: none;
            border-radius: 25px;
            font-size: 1.2rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            animation: buttonBounce 2s infinite;
            margin-top: 20px;
        }

        button:hover {
            background-color: #e65b50;
            transform: scale(1.1);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        #message {
            margin-top: 24px;
            color: #ffeb3b;
            font-size: 1.3rem;
            opacity: 0;
            transform: translateY(10px);
            transition: opacity 0.5s ease, transform 0.5s ease;
        }

        footer {
            margin-top: 40px;
            font-size: 0.9rem;
            text-align: center;
        }

        .footer-text {
            margin-top: 10px;
            font-size: 1rem;
            font-style: italic;
            color: #ffeb3b;
            text-shadow: 0 0 10px rgba(255, 235, 59, 0.5), 0 0 20px rgba(255, 235, 59, 0.3);
            animation: glow 2s ease-in-out infinite alternate;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes textAppear {
            0% { opacity: 0; transform: translateY(-30px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes buttonBounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }

        @keyframes glow {
            from { text-shadow: 0 0 10px rgba(255, 235, 59, 0.5), 0 0 20px rgba(255, 235, 59, 0.3); }
            to { text-shadow: 0 0 20px rgba(255, 235, 59, 0.8), 0 0 30px rgba(255, 235, 59, 0.6); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to My DevOps Project 6</h1>
        <p>Technologies Used: Jenkins, Docker, Kubernetes, Tomcat.</p>
        <p>Languages Used: HTML, CSS, Java, JavaScript.</p>
        <button onclick="displayMessage()">Click Me</button>
        <p id="message"></p>
    </div>
    <footer>
        
        <p class="footer-text">This website was created by Pratik Pardeshi, a professional Aws Devops Engineer with expertise in Jenkins, Docker, Kubernetes, Tomcat etc.</p>
        
    </footer>

    <script>
        function displayMessage() {
            const message = document.getElementById('message');
            message.innerText = "Welcome to the exciting world of DevOps with Pratik Pardeshi!";
            message.style.opacity = 1;
            message.style.transform = 'translateY(0)';
        }
    </script>
</body>
</html>
