import React from 'react';
import { Form, Input, Button, Checkbox, message } from 'antd';
import { UserOutlined, LockOutlined } from '@ant-design/icons';
import AuthService from '../services/auth.service';

function Login() {
    
  const onFinish = async(values) => {
    console.log('Received values:', values);

    try {

        const payload = {
            username: values.username,
            password: values.password,
          };
    
          const regis = await AuthService.login(payload);
          var response = regis.data;
          if(response.msg){
            message.success(response.msg);

            const token = response.access_token.split('|')[1];
            localStorage.setItem("token", token);
            localStorage.setItem("username", response.username);

            window.location.href ='/dashboard';


          }else{

        message.error(response.error);

          }
        
    } catch (error) {

        console.log(error)

        
    }

  };

  return (
    <div className="login-container" style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
      <div>
        <h2>Login</h2>
        <Form
          name="login-form"
          initialValues={{
            remember: true,
          }}
          onFinish={onFinish}
        >
          <Form.Item name="username" rules={[
              { required: true, message: 'Please enter your username' },
            ]}>
            <Input prefix={<UserOutlined />} placeholder="Username" />
          </Form.Item>

          <Form.Item name="password" rules={[
              { required: true, message: 'Please enter your password' },
            ]}>
            <Input prefix={<LockOutlined />} type='password' placeholder="Password" />
          </Form.Item>

          <Form.Item>
            <Form.Item name="remember" valuePropName="checked" noStyle>
              <Checkbox>Remember me</Checkbox>
            </Form.Item>
       
          </Form.Item>

          <Form.Item>
            <Button type="primary" htmlType="submit" className="login-form-button">
              Log in
            </Button>
          </Form.Item>

          <Form.Item>
            Or <a href="/register">register now!</a>
          </Form.Item>
        </Form>
      </div>
    </div>
  );
}

export default Login;
