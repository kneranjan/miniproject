 Real-Time Heart Rate Monitor Dashboard

A web-based heart rate monitoring system that displays live ECG waveforms and vital statistics from an ESP8266 microcontroller and MAX30102 pulse oximeter sensor.

🌟 Features

- Real-Time ECG Graph: Live animated electrocardiogram-style waveform visualization
- Heart Rate Monitoring: Continuous BPM (Beats Per Minute) tracking
- Smart LED Indicator: Color-coded status system
  - 🔵 Blue: Low heart rate (<60 BPM) - Bradycardia
  - 🟢 Green: Normal heart rate (60-100 BPM)
  - 🟠 Orange: Elevated heart rate (100-120 BPM)
  - 🔴 Red: High heart rate (>120 BPM) - Tachycardia
- Alert System: Visual and audio buzzer warnings for abnormal heart rates (>120 BPM)
- Firebase Integration: Real-time database synchronization for data storage and retrieval
- Responsive Design: Works seamlessly on desktop, tablet, and mobile devices
- Live Connection Status: Visual indicator showing Firebase connection status

🛠️ Technology Stack

Hardware
- ESP8266 - WiFi-enabled microcontroller
- MAX30102 - Pulse oximeter and heart rate sensor
- LCD Display (I2C) - 16x2 character display for local readings
- Arduino IDE for programming

Software
- Frontend: HTML5, CSS3, JavaScript (ES6 Modules)
- Backend: Firebase Realtime Database
- Libraries: 
  - Firebase SDK v10.7.1
  - PulseSensorPlayground (Arduino)
  - Firebase_ESP_Client (ESP8266)

📊 Data Flow Pipeline
```
MAX30102 Sensor → ESP8266 → Arduino IDE → Firebase Realtime DB → Web Dashboard
```

1. MAX30102 sensor detects heartbeat and calculates BPM
2. ESP8266 processes the data and displays it on LCD
3. Data is uploaded to Firebase Realtime Database every 20 seconds
4. Web dashboard fetches and displays real-time updates
5. ECG graph animates based on live BPM readings

🚀 Quick Start

Hardware Setup

1. Connect MAX30102 to ESP8266:
   - VIN → 3.3V
   - GND → GND
   - SDA → D2 (GPIO4)
   - SCL → D1 (GPIO5)

2. Connect I2C LCD Display:
   - VCC → 5V
   - GND → GND
   - SDA → D2 (GPIO4)
   - SCL → D1 (GPIO5)

Firebase Configuration

1. Create a Firebase project at Firebase Console (https://console.firebase.google.com/)
2. Enable Realtime Database
3. Set database rules to:
```json
{
  "rules": {
    ".read": true,
    ".write": true
  }
}
```
4. Copy your Firebase configuration credentials

Arduino Setup

1. Install required libraries:
   - ESP8266WiFi
   - Firebase_ESP_Client
   - PulseSensorPlayground
   - LiquidCrystal_I2C

2. Update credentials in Arduino code:
```cpp
#define WIFI_SSID "Your_WiFi_Name"
#define WIFI_PASSWORD "Your_WiFi_Password"
#define FIREBASE_HOST "your-project.firebaseio.com"
#define FIREBASE_AUTH "your_database_secret"
```

3. Upload the code to ESP8266

Web Dashboard Deployment

1. Clone this repository
2. Update Firebase config in index.html:
```javascript
const firebaseConfig = {
  apiKey: "YOUR_API_KEY",
  authDomain: "YOUR_AUTH_DOMAIN",
  databaseURL: "YOUR_DATABASE_URL",
  projectId: "YOUR_PROJECT_ID",
  storageBucket: "YOUR_STORAGE_BUCKET",
  messagingSenderId: "YOUR_SENDER_ID",
  appId: "YOUR_APP_ID"
};
```
3. Deploy to GitHub Pages or any web hosting service

📱 Usage

1. Power on the ESP8266 device
2. Place finger on MAX30102 sensor
3. Wait for stable readings (shown on LCD)
4. Open web dashboard in browser
5. Monitor real-time heart rate and ECG graph

🎨 Dashboard Interface

- Header: Connection status and sensor information
- BPM Display: Large, easy-to-read current heart rate
- ECG Graph: Real-time waveform visualization with grid
- LED Indicator: Color-coded health status
- Buzzer Alert: Visual warning system
- Last Update: Timestamp of most recent data
- Data Flow Diagram: Visual representation of system architecture

⚡ Key Highlights

- Update Frequency: Data sent to Firebase every 20 seconds
- Real-time Sync: Dashboard updates instantly when new data arrives
- Health Monitoring: Automatic classification of heart rate zones
- Alert Threshold: Warning triggers at >120 BPM
- Sensor Threshold: Configurable at 512 (analog reading)

🔧 Troubleshooting

Connection Issues:
- Verify WiFi credentials
- Check Firebase database rules
- Ensure Firebase URL includes https://

No Readings:
- Check sensor placement on finger
- Verify sensor wiring connections
- Ensure proper power supply (3.3V for MAX30102)

Graph Not Showing:
- Open browser console (F12) to check for errors
- Verify Firebase data structure matches /readings path
- Check if BPM values are being received

📄 License

This project is open source and available for educational purposes.

👨‍💻 Credits

Created by Tech StudyCell

🤝 Contributing

Feel free to fork this project and submit pull requests for improvements!

📧 Contact

For questions or support, please open an issue in this repository.
