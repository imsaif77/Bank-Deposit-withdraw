import React, { useEffect, useState } from 'react';
import { Form, Input, Button, Select, message, Table } from 'antd';
import AuthService from '../services/auth.service';
import moment from 'moment';
import CustomerDashboard from './CustomerDashboard';
import BankerDashboard from './BankerDashboard';

const { Option } = Select;

const Dashboard = () => {
  const [form] = Form.useForm();
  const [profile, setProfile] = useState([]);
 

  var getusername = AuthService.getUsername();

  async function getprofile() {
    const payload = {
      username: getusername,
    };
    const response = await AuthService.profile(payload);
    setProfile(response.data.data);
  }

  const handleLogout = () => {
   
    localStorage.clear()
    window.localStorage.href="/login"

  };

  useEffect(() => {
    if(getusername){
    getprofile();
    }
  }, []);




  return (
    <div>
      <nav style={{ backgroundColor: 'lightblue', padding: '10px' }}>
        <span style={{ marginRight: '10px' }}>Welcome, {getusername}</span>
        <Button type="primary" onClick={handleLogout}>
          Logout
        </Button>
      </nav>

      {profile && profile.role === "customer" ? <CustomerDashboard getusername={getusername} profile={profile} /> :   <BankerDashboard getusername={getusername} profile={profile} />}
      
    


    </div>
  );
};

export default Dashboard;
