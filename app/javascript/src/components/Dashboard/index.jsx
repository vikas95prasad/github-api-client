import React from "react";

import { Route, Redirect, Switch } from "react-router-dom";

import Navbar from "components/Common/Navbar";

import PasswordEdit from "./Account/Passwords/Edit";
import Profile from "./Account/Profile";
import Search from "./Search";

const Home = () => {
  return (
    <div className="flex h-screen">
      <Navbar />
      <div className="flex flex-col items-start justify-start flex-grow h-screen overflow-y-auto">
        <Switch>
          <Route exact path="/search" component={Search} />
          <Route exact path="/my/password/edit" component={PasswordEdit} />
          <Route exact path="/my/profile" component={Profile} />
          <Redirect from="/" to="/search" />
        </Switch>
      </div>
    </div>
  );
};

export default Home;
