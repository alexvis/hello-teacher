import React from 'react'
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import SchoolsContainer from './containers/SchoolsContainer'
import NabBar from './components/NabBar'
import ClassroomsForm from './containers/ClassroomsForm'

const App = (props) => {
  return(
    <Router history={browserHistory}>
      <Route path='/users/:id' component={NabBar}>
        <Route path='/users/:user_id/schools' component={SchoolsContainer}/>
        <Route path='/users/:user_id/schools/:school_id/classrooms' component={ClassroomsForm}/>
      </Route>
    </Router>
  )
}

export default App;
