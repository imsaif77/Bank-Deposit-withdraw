import axios from "axios";

const AuthService = {

    register(payload) {

        return axios.post(`${process.env.REACT_APP_API}register`, 
        payload,{
            headers: {
            'Content-Type': 'application/json'
            },
         },
         )

    },

    login(payload) {

        return axios.post(`${process.env.REACT_APP_API}login`, 
        payload,{
            headers: {
            'Content-Type': 'application/json'
            },
         },
         )

    },



       getToken(){
        const tokenString = localStorage.getItem('token');
        const userToken = JSON.parse(tokenString);
        return userToken;
    },

    getUsername(){
        const username = localStorage.getItem('username');
        return username;
    },



    profile(payload) {
        return axios.post(
          `${process.env.REACT_APP_API}profile`,
          payload,
          {
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${localStorage.getItem('token')}`,
            },
          },
        );
      },


    deposit(payload) {
        return axios.post(
          `${process.env.REACT_APP_API}deposit`,
          payload,
          {
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${localStorage.getItem('token')}`,
            },
          },
        );
      },

      withdraw(payload) {
        return axios.post(
          `${process.env.REACT_APP_API}withdraw`,
          payload,
          {
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${localStorage.getItem('token')}`,
            },
          },
        );
      },

      usertransaction(payload) {
        return axios.post(
          `${process.env.REACT_APP_API}transaction`,
          payload,
          {
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${localStorage.getItem('token')}`,
            },
          },
        );
      },

      allCustomers() {
        return axios.get(
          `${process.env.REACT_APP_API}allcustomer`,
          {
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${localStorage.getItem('token')}`,
            },
          },
        );
      },


}

export default AuthService