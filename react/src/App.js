import React from 'react'
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import SchoolsContainer from './containers/SchoolsContainer'
import NabBar from './components/NabBar'


const App = (props) => {
  return(
    <Router history={browserHistory}>
      <Route path='/users/:id' component={NabBar}>
        <Route path='/schools' component={SchoolsContainer}/>
      </Route>
    </Router>
  )
}

export default App;
