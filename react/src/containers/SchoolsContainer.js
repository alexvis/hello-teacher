import React, { Component } from 'react'
import TextField from '../components/TextField'
import DropDownField from '../components/DropDownField'

class SchoolsContainer extends Component{
  constructor(props){
    super(props)
    this.state = {
      nameError: '',
      stateError: '',
      cityError: '',
      addressError: '',
      zipError: '',
      id: '',
      name: '',
      address: '',
      city: '',
      state: '',
      zipCode: '',
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this);

    this.handleSchoolName = this.handleSchoolName.bind(this);
    this.handleSchoolAddress = this.handleSchoolAddress.bind(this);
    this.handleSchoolCity= this.handleSchoolCity.bind(this);
    this.handleSchoolState = this.handleSchoolState.bind(this);
    this.handleSchoolZipCode = this.handleSchoolZipCode.bind(this);

    this.validateNameSelection = this.validateNameSelection.bind(this);
    this.validateAddressSelection =     this.validateAddressSelection.bind(this);
    this.validateCitySelection = this.validateCitySelection.bind(this);
    this.validateStateSelection = this.validateStateSelection.bind(this);
    this.validateZipSelection = this.validateZipSelection.bind(this);

    this.addNewSchool = this.addNewSchool.bind(this);
    this.clearForm = this.clearForm.bind(this);
  }


  addNewSchool(formPayload) {
    let id = this.props.params.user_id
    fetch(`/api/v1/users/${id}/schools`, {
      method: 'POST',
    body: JSON.stringify(formPayload)
  })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  validateNameSelection(selection) {
      if (selection === '') {
        this.setState({nameError: "School Name can't be empty!"})
        return(false)
    }else{
      this.setState({nameError: ''})
      return (true)
    }
  }


    validateCitySelection(selection) {
        if (selection === '') {
          this.setState({cityError: "City can't be empty!"})
          return(false)
      }else{
        this.setState({cityError: ''})
        return (true)
      }
    }

  validateStateSelection(selection) {
      if (selection === '') {
        this.setState({stateError: "State can't be empty!"})
        return(false)
    }else{
      this.setState({stateError: ''})
      return (true)
    }
  }

  validateAddressSelection(selection) {
      if (selection === '') {
        this.setState({addressError: "Address can't be empty!"})
        return(false)
    }else{
      this.setState({addressError: ''})
      return (true)
    }
  }

  validateZipSelection(selection) {
      if (selection === '') {
        this.setState({zipError: "Zip Code can't be empty!"})
    }else{
      this.setState({zipError: ''})
    }
  }



handleSchoolName(event){
  this.setState({name: event.target.value})
  console.log(this.state.name)
}

 handleSchoolAddress(event){
  this.setState({address: event.target.value})
  console.log(this.state.address)
}

handleSchoolCity(event){
  this.setState({city: event.target.value})
  console.log(this.state.city)
}

handleSchoolState(event){
  this.setState({state: event.target.value})
  console.log(this.state.state)
}
handleSchoolZipCode(event){
  this.setState({zipCode: (event.target.value)})
  console.log(this.state.zipCode)
}

  handleFormSubmit(event) {
    event.preventDefault();
    if(
      this.validateNameSelection(this.state.name) & this.validateAddressSelection(this.state.address) &
      this.validateCitySelection(this.state.city) & this.validateStateSelection(this.state.state) &
      this.validateZipSelection(this.state.zipCode)
    ){
      console.log("error")
    } else {
    let formPayload = {
      name: this.state.name,
      address: this.state.address,
      city: this.state.city,
      state: this.state.state,
      zip_code: this.state.zipCode,
      user_id: this.props.params.user_id,
    };
    this.addNewSchool(formPayload);
    this.clearForm();
   }
  };

  clearForm() {
    this.setState({
      name: '',
      address: '',
      state: '',
      city: '',
      zipCode: '',
    })
  }

  render(){
    return(

      <div className="translucent-form-overlay">

      <form onSubmit={this.handleFormSubmit}>

      <div className="row columns">
        {this.state.nameError}
        <TextField
          content={this.state.name}
          label="Name"
          name="name"
          handleChange={this.handleSchoolName}
        />
        </div>

        <div className="row columns">
        {this.state.addressError}
        <TextField
          content={this.state.address}
          label="Address"
          name="address"
          handleChange={this.handleSchoolAddress}
        />
        </div>

        <div className="row columns">
        {this.state.cityError}
        <TextField
          content={this.state.city}
          label="City"
          name="city"
          handleChange={this.handleSchoolCity}
        />
        </div>

        <div className="row">

        <div className="columns small-6">
        {this.state.stateError}
        <DropDownField
            label={'State'}
            rating={this.state.state}
            handleSelect={this.handleSchoolState}
          />
        </div>

        <div className="columns small-6">

        {this.state.zipError}
        <TextField
          content={this.state.zipCode}
          label="Zip Code"
          name="zipCode"
          handleChange={this.handleSchoolZipCode}
        />
        </div>
        </div>

        <div className="button-group">
          <button className="button" onClick={this.clearForm}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
      </div>

    )
  }
}

export default SchoolsContainer;
