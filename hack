<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aid Aly | Connecting Donors & NGOs</title>
    <style>
        :root {
            --primary: #4f46e5;
            --secondary: #059669;
            --bg: #f8fafc;
            --card: #ffffff;
            --text: #1e293b;
            --light-text: #64748b;
        }

        body {
            font-family: 'Inter', -apple-system, sans-serif;
            background-color: var(--bg);
            color: var(--text);
            margin: 0;
            padding: 15px;
        }

        .container {
            max-width: 900px;
            margin: 20px auto;
            background: var(--card);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            min-height: 550px;
            position: relative;
        }

        /* Navigation */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .back-btn {
            background: #f1f5f9;
            border: 1px solid #e2e8f0;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            color: var(--light-text);
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .back-btn:hover { background: #e2e8f0; }
        .hidden { display: none; }

        h1.logo { font-size: 2rem; color: var(--primary); margin: 0; font-weight: 800; }

        /* Portal Selection */
        .selection-box {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 50px;
        }

        .choice-card {
            border: 2px solid #f1f5f9;
            padding: 40px 20px;
            border-radius: 15px;
            text-align: center;
            cursor: pointer;
            transition: 0.3s;
        }

        .choice-card:hover { border-color: var(--primary); background: #f5f3ff; }

        /* Form Styling */
        .form-container { max-width: 400px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 6px; font-weight: 600; font-size: 0.9rem; }
        
        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            box-sizing: border-box;
            font-size: 1rem;
        }

        .btn-submit {
            width: 100%;
            padding: 14px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
        }

        /* Dashboards */
        .stats-row { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-bottom: 25px; }
        .stat-card { background: #f8fafc; padding: 20px; border-radius: 15px; text-align: center; border-bottom: 3px solid var(--primary); }
        .stat-val { font-size: 1.8rem; font-weight: 800; color: var(--primary); }

        .dashboard-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .match-box { background: #fffbeb; border: 1px solid #fef3c7; padding: 20px; border-radius: 15px; }
        .match-item { 
            background: white; border: 1px solid #e2e8f0; padding: 12px; border-radius: 10px; 
            margin-top: 10px; display: flex; justify-content: space-between; align-items: center;
        }

        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #f1f5f9; font-size: 0.9rem; }
        th { color: var(--light-text); text-transform: uppercase; font-size: 0.75rem; }

        .badge { background: #dcfce7; color: #166534; padding: 4px 10px; border-radius: 6px; font-size: 0.8rem; font-weight: 600; }
    </style>
</head>
<body>

<div class="container">
    <!-- TOP NAVIGATION -->
    <div class="header">
        <button id="backBtn" class="back-btn hidden" onclick="handleNavigationBack()">← Back</button>
        <h1 class="logo">Aid Aly</h1>
        <div style="width: 70px;"></div>
    </div>

    <!-- 1. SCREEN: CHOICE -->
    <div id="viewSelection">
        <h2 style="text-align: center;">Choose Your Portal</h2>
        <div class="selection-box">
            <div class="choice-card" onclick="openAuth('donor')">
                <h3 style="color:var(--primary)">Donor Portal</h3>
                <p>I want to donate items or funds.</p>
            </div>
            <div class="choice-card" onclick="openAuth('ngo')">
                <h3 style="color:var(--secondary)">NGO Portal</h3>
                <p>I represent an organisation in need.</p>
            </div>
        </div>
    </div>

    <!-- 2. SCREEN: AUTH (LOGIN/SIGNUP) -->
    <div id="viewAuth" class="hidden">
        <div class="form-container">
            <h2 id="authTitle" style="text-align: center;">Login</h2>
            <form onsubmit="handleAuth(event)">
                <div id="signupFields" class="hidden">
                    <div class="form-group">
                        <label id="nameLabel">Full Name</label>
                        <input type="text" id="regName" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="tel" id="regPhone" placeholder="10-digit mobile" pattern="[0-9]{10}">
                    </div>
                    <div id="ngoFields" class="hidden">
                        <div class="form-group">
                            <label>Organisation Address</label>
                            <textarea id="regAddr" rows="2" placeholder="Street, City, Pincode"></textarea>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" id="authEmail" required placeholder="example@email.com">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" id="authPass" required placeholder="••••••••">
                </div>

                <button type="submit" class="btn-submit" id="authBtn">Login</button>
                <p style="text-align:center; font-size:0.85rem; margin-top:15px;">
                    <span id="authToggle" style="color:var(--primary); cursor:pointer; font-weight:700;" onclick="toggleAuth()">
                        Don't have an account? Sign Up
                    </span>
                </p>
            </form>
        </div>
    </div>

    <!-- 3. SCREEN: DONOR DASHBOARD -->
    <div id="viewDonorDash" class="hidden">
        <div class="stats-row">
            <div class="stat-card"><div>Total Donated</div><div class="stat-val" id="dStatFunds">₹0</div></div>
            <div class="stat-card"><div>Items Shared</div><div class="stat-val" id="dStatItems">0</div></div>
        </div>

        <div class="dashboard-grid">
            <div>
                <h3>Make a Donation</h3>
                <div class="form-group">
                    <label>Donor Type</label>
                    <select id="donorType"><option>Individual</option><option>Corporate Organisation</option></select>
                </div>
                <div class="form-group">
                    <label>Items to Donate</label>
                    <div style="background:#f8fafc; padding:12px; border-radius:10px;">
                        <label style="font-weight:400"><input type="checkbox" class="give" value="Books" onchange="matchNgos()"> Books</label><br>
                        <label style="font-weight:400"><input type="checkbox" class="give" value="Clothing" onchange="matchNgos()"> Clothing/Shelter</label><br>
                        <label style="font-weight:400"><input type="checkbox" class="give" value="Funds" id="chkFunds" onchange="toggleFundUI(); matchNgos();"> Funds (₹)</label>
                    </div>
                </div>
                <div id="fundInput" class="hidden">
                    <label>Amount in Rupees (₹)</label>
                    <input type="number" id="donAmount" placeholder="₹ Amount">
                </div>
            </div>
            <div class="match-box">
                <h4 style="margin-top:0">NGO Matches (Algorithm)</h4>
                <div id="matchResults">
                    <p style="font-size:0.8rem; color:var(--light-text); text-align:center;">Select items to find NGOs in need.</p>
                </div>
            </div>
        </div>

        <h3>Your Donation History</h3>
        <table id="donorTable">
            <thead><tr><th>Date</th><th>NGO Name</th><th>Details</th></tr></thead>
            <tbody></tbody>
        </table>
    </div>

    <!-- 4. SCREEN: NGO DASHBOARD -->
    <div id="viewNgoDash" class="hidden">
        <div class="stats-row">
            <div class="stat-card"><div>Total Funds Raised</div><div class="stat-val" id="nStatFunds">₹0</div></div>
            <div class="stat-card"><div>Total Benefactors</div><div class="stat-val" id="nStatDonors">0</div></div>
        </div>

        <div class="dashboard-grid">
            <div style="border:1px solid #e2e8f0; padding:20px; border-radius:15px;">
                <h3>NGO Profile & Needs</h3>
                <div class="form-group">
                    <label>Organisation Description</label>
                    <textarea id="ngoDesc" rows="3" placeholder="Tell donors about your mission..."></textarea>
                </div>
                <div class="form-group">
                    <label>What are your requirements?</label>
                    <div style="background:#f8fafc; padding:12px; border-radius:10px;">
                        <label style="font-weight:400"><input type="checkbox" class="need" value="Books"> Need Books</label><br>
                        <label style="font-weight:400"><input type="checkbox" class="need" value="Clothing"> Need Clothing</label><br>
                        <label style="font-weight:400"><input type="checkbox" class="need" value="Funds"> Need Funds</label>
                    </div>
                </div>
                <button class="btn-submit" onclick="updateNgoRequirements()">Update Profile</button>
            </div>
            <div>
                <h3>Donations Received</h3>
                <table id="ngoTable">
                    <thead><tr><th>Donor</th><th>Phone</th><th>Item</th></tr></thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    // Data Management
    let users = JSON.parse(localStorage.getItem('aly_users')) || [];
    let transactions = JSON.parse(localStorage.getItem('aly_tx')) || [];
    
    let currentView = 'selection';
    let roleState = '';
    let isSignupMode = false;
    let loggedInUser = null;

    // NAVIGATION
    function setView(viewId) {
        currentView = viewId;
        const views = ['viewSelection', 'viewAuth', 'viewDonorDash', 'viewNgoDash'];
        views.forEach(v => document.getElementById(v).classList.add('hidden'));
        document.getElementById(viewId).classList.remove('hidden');
        document.getElementById('backBtn').classList.toggle('hidden', viewId === 'viewSelection');
    }

    function handleNavigationBack() {
        if (currentView === 'viewAuth') setView('viewSelection');
        else if (currentView === 'viewDonorDash' || currentView === 'viewNgoDash') {
            loggedInUser = null;
            setView('viewSelection');
        }
    }

    // AUTH
    function openAuth(role) {
        roleState = role;
        isSignupMode = false;
        updateAuthUI();
        setView('viewAuth');
    }

    function toggleAuth() {
        isSignupMode = !isSignupMode;
        updateAuthUI();
    }

    function updateAuthUI() {
        document.getElementById('authTitle').innerText = (isSignupMode ? 'Sign Up' : 'Login') + ' (' + roleState.toUpperCase() + ')';
        document.getElementById('signupFields').classList.toggle('hidden', !isSignupMode);
        document.getElementById('ngoFields').classList.toggle('hidden', !isSignupMode || roleState === 'donor');
        document.getElementById('nameLabel').innerText = roleState === 'donor' ? 'Full Name' : 'Organisation Name';
        document.getElementById('authBtn').innerText = isSignupMode ? 'Create Account' : 'Login';
        document.getElementById('authToggle').innerText = isSignupMode ? 'Already have an account? Login' : "Don't have an account? Sign Up";
    }

    function handleAuth(e) {
        e.preventDefault();
        const email = document.getElementById('authEmail').value.toLowerCase();
        const pass = document.getElementById('authPass').value;

        if (isSignupMode) {
            const name = document.getElementById('regName').value;
            const phone = document.getElementById('regPhone').value;
            const addr = document.getElementById('regAddr').value;

            if (users.find(u => u.email === email)) return alert("Email already registered.");

            users.push({ email, pass, name, phone, addr, role: roleState, needs: [], desc: '' });
            localStorage.setItem('aly_users', JSON.stringify(users));
            alert("Account created! Please login.");
            toggleAuth();
        } else {
            const user = users.find(u => u.email === email && u.pass === pass && u.role === roleState);
            if (user) {
                loggedInUser = user;
                setView(roleState === 'donor' ? 'viewDonorDash' : 'viewNgoDash');
                refreshData();
            } else {
                alert("Invalid email or password.");
            }
        }
    }

    // DONOR FUNCTIONS
    function toggleFundUI() {
        document.getElementById('fundInput').classList.toggle('hidden', !document.getElementById('chkFunds').checked);
    }

    function matchNgos() {
        const giving = Array.from(document.querySelectorAll('.give:checked')).map(c => c.value);
        const container = document.getElementById('matchResults');
        container.innerHTML = "";

        if (giving.length === 0) {
            container.innerHTML = "<p style='font-size:0.8rem; color:var(--light-text); text-align:center;'>Select items to find NGOs.</p>";
            return;
        }

        const matches = users.filter(u => u.role === 'ngo' && u.needs.some(n => giving.includes(n)));

        if (matches.length === 0) {
            container.innerHTML = "<p style='font-size:0.8rem; text-align:center;'>No NGOs currently need these items.</p>";
        } else {
            matches.forEach(ngo => {
                container.innerHTML += `
                    <div class="match-item">
                        <div><strong>${ngo.name}</strong><br><small>${ngo.addr.substring(0,30)}...</small></div>
                        <button class="badge" style="border:none; cursor:pointer;" onclick="submitDonation('${ngo.email}')">Donate</button>
                    </div>`;
            });
        }
    }

    function submitDonation(ngoEmail) {
        const ngo = users.find(u => u.email === ngoEmail);
        const items = Array.from(document.querySelectorAll('.give:checked')).map(c => c.value);
        const amount = document.getElementById('donAmount').value || 0;

        transactions.push({
            date: new Date().toLocaleDateString(),
            dEmail: loggedInUser.email,
            dName: loggedInUser.name,
            dPhone: loggedInUser.phone,
            nEmail: ngo.email,
            nName: ngo.name,
            itemStr: items.join(", "),
            cash: items.includes("Funds") ? parseInt(amount) : 0
        });

        localStorage.setItem('aly_tx', JSON.stringify(transactions));
        alert("Donation successful!");
        refreshData();
    }

    // NGO FUNCTIONS
    function updateNgoRequirements() {
        const needs = Array.from(document.querySelectorAll('.need:checked')).map(c => c.value);
        const desc = document.getElementById('ngoDesc').value;
        const idx = users.findIndex(u => u.email === loggedInUser.email);
        users[idx].needs = needs;
        users[idx].desc = desc;
        loggedInUser = users[idx];
        localStorage.setItem('aly_users', JSON.stringify(users));
        alert("NGO Profile updated.");
    }

    // REFRESH DATA
    function refreshData() {
        if (loggedInUser.role === 'donor') {
            const myHistory = transactions.filter(t => t.dEmail === loggedInUser.email);
            document.getElementById('dStatFunds').innerText = "₹" + myHistory.reduce((s, t) => s + t.cash, 0);
            document.getElementById('dStatItems').innerText = myHistory.length;
            document.getElementById('donorTable').querySelector('tbody').innerHTML = myHistory.map(t => `
                <tr><td>${t.date}</td><td>${t.nName}</td><td>${t.itemStr} ${t.cash > 0 ? '(₹'+t.cash+')' : ''}</td></tr>
            `).join('');
        } else {
            const myReceived = transactions.filter(t => t.nEmail === loggedInUser.email);
            document.getElementById('nStatFunds').innerText = "₹" + myReceived.reduce((s, t) => s + t.cash, 0);
            document.getElementById('nStatDonors').innerText = myReceived.length;
            document.getElementById('ngoTable').querySelector('tbody').innerHTML = myReceived.map(t => `
                <tr><td>${t.dName}</td><td>${t.dPhone}</td><td>${t.itemStr}</td></tr>
            `).join('');
            document.getElementById('ngoDesc').value = loggedInUser.desc;
        }
    }
</script>

</body>
</html>
