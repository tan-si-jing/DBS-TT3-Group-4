// //C:\react-js\myreactdev\src\App.js
import React from "react";
import "./App.css";

import { BrowserRouter, Routes, Route, useNavigate } from "react-router-dom";

import Dashboard from "./pages/Dashboard";
import CreateClaim from "./pages/CreateClaim";
import UpdateClaim from "./pages/UpdateClaim";
import Home from "./components/Home";
import MainNavigation from "./components/MainNavigation";
import Login from "./components/Login";
import Register from "./components/Register";

import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';

const App = () => {
  return (
    <div className="vh-100 gradient-custom">
      <div className="container">
        <LocalizationProvider dateAdapter={AdapterDayjs}>
        <BrowserRouter>
          <MainNavigation />
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/createclaim" element={<CreateClaim />} />
            <Route path="/editclaim" element={<UpdateClaim />} />
            <Route path="/auth/login" element={<Login/>} />
            <Route path="/auth/register" element={<Register/>}/>
          </Routes>
        </BrowserRouter>
        </LocalizationProvider>
      </div>
    </div>
  );
};

export default App;
