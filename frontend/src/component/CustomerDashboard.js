import React, { useEffect, useState } from 'react';
import { Form, Input, Button, Select, message, Table } from 'antd';
import AuthService from '../services/auth.service';
import moment from 'moment';

const { Option } = Select;

const CustomerDashboard = ({getusername, profile}) => {
  const [form] = Form.useForm();
  const [UserTransaction, setUserTransaction] = useState([]);
  const [selectedAccount, setSelectedAccount] = useState('Deposit');


  
  async function getUserTransaction() {
    const payload = {
      username: getusername,
    };
    const response = await AuthService.usertransaction(payload);
    setUserTransaction(response.data.data);
  }

  useEffect(() => {
    if(getusername){
    getUserTransaction();
    }
  }, []);

  const handleSubmit = async (values) => {
    const payload = {
      username: getusername,
      amount: Number(values.amount),
    };
    if (values.account === 'Deposit') {
      var regis = await AuthService.deposit(payload);
    } else {
      var regis = await AuthService.withdraw(payload);
    }

    var response = regis.data;
    if (response.msg) {
      message.success(response.msg);
    } else {
      message.error(response.error);
    }
  };

  


  const handleAccountChange = (value) => {
    setSelectedAccount(value); 
  };




  const dataSource =[];

  for(let i=0 ; i< UserTransaction.length; ++i){

    dataSource.push({

      key: i,
      amount: UserTransaction[i].amount,
      type: UserTransaction[i].type,
      created_at:  moment(UserTransaction[i].created_at).format("DD-MM-YYYY H:mm:s"),

    })

  }
  
  const columns = [
    {
      title: 'Created At',
      dataIndex: 'created_at',
      key: 'created_at',
    },
    
    {
      title: 'Transaction Type',
      dataIndex: 'type',
      key: 'type',
    },

    {
      title: 'Amount',
      dataIndex: 'amount',
      key: 'amount',
    },
  ];
  


  return (
    <div>

       <h3>Amount : {profile.amount}</h3>

      <div style={{ display: 'flex', justifyContent: 'center' }}>
        <Form form={form} onFinish={handleSubmit} layout="vertical">
          <Form.Item
            name="account"
            label="Account"
            rules={[{ required: true, message: 'Please select an account' }]}
          >
            <Select placeholder="Pay" onChange={handleAccountChange}>
              <Option value="Deposit">Deposit</Option>
              <Option value="Withdraw">Withdraw</Option>
            </Select>
          </Form.Item>
          <Form.Item
            name="amount"
            label="Amount"
            rules={[
              { required: true, message: 'Please enter the deposit amount' },
            ]}
          >
            <Input type="number" placeholder="Enter the deposit amount" />
          </Form.Item>
          <Form.Item>
            <Button type="primary" htmlType="submit">
              {selectedAccount} 
            </Button>
          </Form.Item>
        </Form>

        
      </div>

      <Table dataSource={dataSource} columns={columns} />;


    </div>
  );
};

export default CustomerDashboard;
