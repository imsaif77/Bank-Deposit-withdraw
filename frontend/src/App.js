import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';
import Login from './component/login';
import Register from './component/register';
import ProtectedRoute from './component/ProtectedRoutes';
import Dashboard from './component/Dashboard';

function NotFound() {
  return (
    <div>
      <h2>404 - Not Found</h2>
      <p>The page you are looking for does not exist.</p>
    </div>
  );
}



function App() {
  return (
    <div className='App'>
      <Router>
        <Routes>
          <Route index path='/login' element={<Login />} />
          <Route path='/register' element={<Register />} />
          <Route path='*' element={<NotFound />} />

          <Route
          exact
          path="/dashboard"
          element={<ProtectedRoute Component={Dashboard} />}
        />

        </Routes>
      </Router>
    </div>
  );
}

export default App;
