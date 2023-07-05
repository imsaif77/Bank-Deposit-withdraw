import React, { useEffect, useState } from 'react';
import { Form, Input, Button, Select, message, Table, Modal } from 'antd';
import AuthService from '../services/auth.service';
import moment from 'moment';

const { Option } = Select;

const BankerDashboard = ({ getusername, profile }) => {
  const [allCustomers, setallCustomers] = useState([]);
  const [transactionModalVisible, setTransactionModalVisible] = useState(false);
  const [selectedUser, setSelectedUser] = useState(null);
  const [userTransactions, setUserTransactions] = useState([]);

  async function getallCustomers() {
    const response = await AuthService.allCustomers();
    setallCustomers(response.data.data);
  }

  useEffect(() => {
    if (getusername) {
      getallCustomers();

    }
  }, []);

 




  const showTransactionModal = async(user) => {
    setSelectedUser(user);
    setUserTransactions(user.transactions);
    const payload = {
        username: user.username,
      };
      const response = await AuthService.usertransaction(payload);
      setUserTransactions(response.data.data);
    setTransactionModalVisible(true);
  };

  const handleTransactionModalClose = () => {
    setTransactionModalVisible(false);
    setSelectedUser(null);
    setUserTransactions([]);
  };

  const dataSource = allCustomers.map((customer, index) => ({
    key: index,
    username: customer.username,
    email: customer.email,
    amount: customer.amount,
    created_at: moment(customer.created_at).format('DD-MM-YYYY H:mm:s'),
    transactions: customer.transactions,
  }));

  const columns = [
    {
      title: 'Created At',
      dataIndex: 'created_at',
      key: 'created_at',
    },
    {
      title: 'Username',
      dataIndex: 'username',
      key: 'username',
    },
    {
      title: 'Email',
      dataIndex: 'email',
      key: 'email',
    },
    {
      title: 'Amount',
      dataIndex: 'amount',
      key: 'amount',
    },
    {
      title: 'Transaction',
      dataIndex: 'key',
      key: 'transaction',
      render: (key, record) => (
        <Button onClick={() => showTransactionModal(record)}>View Transaction</Button>
      ),
    },
  ];

  const transactionColumns = [
    { title: 'Created At', dataIndex: 'created_at', key: 'created_at' },
    { title: 'Transaction Type', dataIndex: 'type', key: 'type' },
    { title: 'Amount', dataIndex: 'amount', key: 'amount' },
  ];

  return (
    <div>
      <Table dataSource={dataSource} columns={columns} />

      <Modal
        title={`Transaction History for ${selectedUser?.username}`}
        visible={transactionModalVisible}
        onCancel={handleTransactionModalClose}
        footer={[
          <Button key="close" onClick={handleTransactionModalClose}>
            Close
          </Button>,
        ]}
      >
        <Table dataSource={userTransactions} columns={transactionColumns} />
      </Modal>
    </div>
  );
};

export default BankerDashboard;
