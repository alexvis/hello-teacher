import React, { Component } from 'react'
import TextField from '../components/TextField'

class ClassroomsForm extends Component{
  constructor(props){
    super(props)
    this.state = {
      subjectError: '',
      gradeError: '',
      classNumberError: '',
      id: '',
      subject: '',
      grade: '',
      classNumber: '',
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this);

    this.handleSubject = this.handleSubject.bind(this);
    this.handleGrade = this.handleGrade.bind(this);
    this.handleClassNumber = this.handleClassNumber.bind(this);

    this.validateSubjectSelection = this.validateSubjectSelection.bind(this);
    this.validateGradeSelection =     this.validateGradeSelection.bind(this);
    this.validateClassNumberSelection = this.validateClassNumberSelection.bind(this);


    this.addNewClassroom = this.addNewClassroom.bind(this);
    this.clearForm = this.clearForm.bind(this);
  }

  addNewClassroom(formPayload) {
    debugger
    let user_id = this.props.params.user_id
    let school_id = this.props.params.school_id

    fetch(`/api/v1/users/${user_id}/schools/${school_id}/classrooms`, {
      method: 'POST',
    body: JSON.stringify(formPayload)
  })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }


  validateSubjectSelection(selection) {
      if (selection === '') {
        this.setState({subjectError: "Subject Name can't be empty!"})
        return(false)
    }else{
      this.setState({subjectError: ''})
      return (true)
    }
  }

    validateClassNumberSelection(selection) {
        if (selection === '') {
          this.setState({classNumberError: "Class Number can't be empty!"})
          return(false)
      }else{
        this.setState({classNumberError: ''})
        return (true)
      }
    }

  validateGradeSelection(selection) {
      if (selection === '') {
        this.setState({gradeError: "Grade can't be empty!"})
    }else{
      this.setState({gradeError: ''})
    }
  }


handleSubject(event){
  this.setState({subject: event.target.value})
  console.log(this.state.subject)
}

 handleGrade(event){
  this.setState({grade: event.target.value})
  console.log(this.state.grade)
}

handleClassNumber(event){
  this.setState({classNumber: event.target.value})
  console.log(this.state.classNumber)
}


  handleFormSubmit(event) {
    event.preventDefault();
    if(
      this.validateSubjectSelection(this.state.subject) & this.validateGradeSelection(this.state.grade) &
      this.validateClassNumberSelection(this.state.classNumber)
    ){
      console.log("error")
    } else {
    let formPayload = {
      subject: this.state.subject,
      grade: this.state.grade,
      class_number: this.state.classNumber,
      user_id: this.props.params.user_id,
      school_id: this.props.params.school_id
    };
    this.addNewClassroom(formPayload);
    this.clearForm();
   }
  };

  clearForm() {
    this.setState({
      subject: '',
      grade: '',
      classNumber: '',
    })
  }

  render(){

    return(

      <div className="translucent-form-overlay">

      <form onSubmit={this.handleFormSubmit}>

      <div className="row columns">
        {this.state.subjectError}
        <TextField
          content={this.state.subject}
          label="Subject"
          name="subject"
          handleChange={this.handleSubject}
        />
        </div>

        <div className="row columns">
        {this.state.gradeError}
        <TextField
          content={this.state.grade}
          label="Grade"
          name="grade"
          handleChange={this.handleGrade}
        />
        </div>

        <div className="row columns">
        {this.state.classNumberError}
        <TextField
          content={this.state.classNumber}
          label="Class Number"
          name="classNumber"
          handleChange={this.handleClassNumber}
        />
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

export default ClassroomsForm;
