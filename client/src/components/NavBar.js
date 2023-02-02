import { Tabs, Tab } from 'react-bootstrap';
import Schedule1 from './Schedule1';
import Schedule2 from './Schedule2';
import Schedule3 from './Schedule3';
import Logo from "../images/nps_logo.png";

const NavBar= () => {

  let firstYear = new Date().getFullYear();
  let secondYear = new Date().getFullYear() + 1;
  let thirdYear = new Date().getFullYear() + 2;

  return (
  <div>
    <p className="program-heading" >Systems Engineering Distance Learning Degree Programs &nbsp;<img src={Logo} height="5%" width="3%" alt="nps logo" /></p>  
    <p>&nbsp;</p>
    <Tabs defaultActiveKey="year1" id="uncontrolled-tab-example" className="mb-3">
        <Tab eventKey="year1" title={ "AY " + firstYear }>
            <Schedule1 academicYear={ firstYear } />
        </Tab>
        <Tab eventKey="year2" title={ "AY " + secondYear }>
            <Schedule2 academicYear= { secondYear } />
        </Tab>
        <Tab eventKey="year3" title={ "AY " + thirdYear }>
        <Schedule3 academicYear={ thirdYear } />
        </Tab>
    </Tabs>
  </div>
  );
}

export default NavBar;