// Firebase SDK'yı import et
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.0.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.0.0/firebase-analytics.js";

// Firebase yapılandırma nesnesi
const firebaseConfig = {
  apiKey:  "AIzaSyAyzHSCUrA0n0UgD0Noq4fCQfF2EzHHCs8",
  authDomain:"vera-cafe.firebaseapp.com",
  projectId: "vera-cafe",
  storageBucket: "vera-cafe.appspot.com",
  messagingSenderId:"vera-cafe.appspot.com",
  appId:  "1:188512746347:web:aa06d8fb7edb4016346a2e",
};

// Firebase'i başlat
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
