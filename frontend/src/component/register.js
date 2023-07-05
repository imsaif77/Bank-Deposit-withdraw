import React from 'react';
import { Form, Input, Button, Checkbox, message } from 'antd';
import { UserOutlined, LockOutlined, MailOutlined } from '@ant-design/icons';
import AuthService from '../services/auth.service';

function Register() {

  const onFinish = async(values) => {

    try {

        const payload = {
            name: values.name,
            username: values.username,
            email: values.email,
            password: values.password,
            confirmPassword: values.confirmPassword
          };
    
          const regis = await AuthService.register(payload);
          var response = regis.data;
          if(response.msg){
            message.success(response.msg);
            window.location.href ='/login';

          }else{

        message.error(response.error);

          }
        
    } catch (error) {

        console.log(error)

        
    }

    

  };



  const [form] = Form.useForm();

  return (
    <div className="register-container" style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
      <div>
        <h2>Register</h2>
        <Form
          form={form}
          name="register-form"
          initialValues={{
            remember: true,
          }}
          onFinish={onFinish}
        >

            <Form.Item
            name="name"
            rules={[
              { required: true, message: 'Please enter your name' },
            ]}
          >
            <Input prefix={<UserOutlined />} placeholder="Name" />
          </Form.Item>

          <Form.Item
            name="username"
            rules={[
              { required: true, message: 'Please enter your username' },
              { min: 4, message: 'Username must be at least 4 characters' },
            ]}
          >
            <Input prefix={<UserOutlined />} placeholder="Username" />
          </Form.Item>

          <Form.Item
            name="email"
            rules={[
              { required: true, message: 'Please enter your email' },
              { type: 'email', message: 'Please enter a valid email address' },
            ]}
          >
            <Input prefix={<MailOutlined />} placeholder="Email" />
          </Form.Item>

          <Form.Item
            name="password"
            rules={[
              { required: true, message: 'Please enter your password' },
              { min: 6, message: 'Password must be at least 6 characters' },
            //   { validator: validatePassword },
            ]}
          >
            <Input prefix={<LockOutlined />} type="password" placeholder="Password" />
          </Form.Item>

          <Form.Item
            name="confirmPassword"
            rules={[
              { required: true, message: 'Please confirm your password' },
            //   { validator: validateConfirmPassword },
            ]}
          >
            <Input prefix={<LockOutlined />} type="password" placeholder="Confirm Password" />
          </Form.Item>

          <Form.Item
            name="agreement"
            valuePropName="checked"
            rules={[{ validator: (_, value) => value ? Promise.resolve() : Promise.reject('Please accept the terms and conditions') }]}
          >
            <Checkbox>
              I have read and agree to the <a href="/terms">Terms and Conditions</a>
            </Checkbox>
          </Form.Item>

          <Form.Item>
            <Button type="primary" htmlType="submit" className="register-form-button">
              Register
            </Button>
          </Form.Item>

          <Form.Item>
            Already have an account? <a href="/login">Log in here</a>
          </Form.Item>
        </Form>
      </div>
    </div>
  );
}

export default Register;
