import SchoolsContainer from '../../src/containers/SchoolsContainer';
import TextField from '../../src/components/TextField';
import DropDownField from '../../src/components/DropDownField';

describe('SchoolsContainer', ()=> {
  let wrapper;

    beforeEach(() => {
      wrapper = mount(
        <SchoolsContainer/>
      )
    });

  it('should render a TextField & DropDownField component', () => {
    wrapper.setState({
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
      zipCode: ''
    })

    expect(wrapper.find('input')).toBePresent()
    expect(wrapper.find('button')).toBePresent()
    expect(wrapper.find(TextField)).toBePresent()
    expect(wrapper.find(DropDownField)).toBePresent()
  })

})
