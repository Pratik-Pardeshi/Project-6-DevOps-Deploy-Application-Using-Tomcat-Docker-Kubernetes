<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AWS DevOps Project 6</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background: #121212;
            color: #e0e0e0;
            overflow-x: hidden;
        }
        header {
            background: #1e1e1e;
            color: #ffffff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        header h1 {
            margin: 0;
            font-size: 2.5em;
            background: linear-gradient(90deg, #ff4081, #ffab40);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .hero {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 40px;
            margin: 20px;
            text-align: center;
            color: #ffffff;
            position: relative;
            overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), rgba(255, 0, 150, 0.3));
            animation: animate-bg 15s linear infinite;
            z-index: 0;
        }
        @keyframes animate-bg {
            0% { background-position: 0 0; }
            100% { background-position: 100% 100%; }
        }
        .hero h2 {
            margin: 0;
            font-size: 2em;
            z-index: 1;
            position: relative;
        }
        .content {
            padding: 20px;
            text-align: center;
        }
        .card {
            background: #1f1f1f;
            border-radius: 10px;
            padding: 20px;
            margin: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: inline-block;
            width: calc(33% - 60px);
            vertical-align: top;
            color: #ffffff;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card h3 {
            margin-top: 0;
        }
        footer {
            background: #1e1e1e;
            color: #ffffff;
            padding: 10px;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.1);
        }
        .btn {
            background: #ff4081;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #ff69b4;
        }
    </style>
</head>
<body>
    <header>
        <h1>AWS DevOps Project 6</h1>
    </header>
    <div class="hero">
        <h2>Welcome to the DevOps Project</h2>
    </div>
    <div class="content">
        <div class="card">
            <h3>Tomcat</h3>
            <p>Deploying applications on Apache Tomcat.</p>
            <button class="btn" onclick="showDetails('tomcat')">Learn More</button>
        </div>
        <div class="card">
            <h3>Docker</h3>
            <p>Containerizing applications using Docker.</p>
            <button class="btn" onclick="showDetails('docker')">Learn More</button>
        </div>
        <div class="card">
            <h3>Kubernetes</h3>
            <p>Managing containers with Kubernetes.</p>
            <button class="btn" onclick="showDetails('kubernetes')">Learn More</button>
        </div>
        <div class="card">
            <h3>Jenkins</h3>
            <p>Continuous integration and delivery with Jenkins.</p>
            <button class="btn" onclick="showDetails('jenkins')">Learn More</button>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 Pratik Pardeshi. All Rights Reserved.</p>
    </footer>
    <script>
        function showDetails(tech) {
            alert('Details about ' + tech + ' will be coming soon!');
        }
    </script>
</body>
</html>
