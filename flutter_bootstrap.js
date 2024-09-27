// Import the functions you need from the SDKs you need
import { initializeApp } from "./firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-
import { getAuth } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';
import { getMessaging } from 'firebase/messaging';

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAyzHSCUrA0n0UgD0Noq4fCQfF2EzHHCs8",
  authDomain: "vera-cafe.firebaseapp.com",
  projectId: "vera-cafe",
  storageBucket: "vera-cafe.appspot.com",
  messagingSenderId: "188512746347",
  appId: "1:188512746347:web:aa06d8fb7edb4016346a2e"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const firestore = getFirestore(app);
const messaging = getMessaging(app);
