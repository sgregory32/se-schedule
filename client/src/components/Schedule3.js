import React, { useState, useEffect } from 'react';
import Axios from "axios";
import '../App.css';

function Schedule3(props) {

    const [isLoading, setIsLoading] = React.useState(true);
    const [mastersList, setMastersList] = useState([]);
    const [certificatesList, setCertificatesList] = useState([]);
    const [noteList, setNoteList] = useState([]);

    let i = 0;
    let j = 0;
    let degreeName = "";

    const API_BASE_URL = process.env.REACT_APP_API_BASE_URL;

    useEffect(() => {
        Axios.get(API_BASE_URL + '/api/master/' + props.academicYear).then((response) => {
            setMastersList(response.data);
        });
    }, [API_BASE_URL, props.academicYear]);

    useEffect(() => {
        Axios.get(API_BASE_URL + '/api/certificate/' + props.academicYear).then((response) => {         
            setCertificatesList(response.data);
        });
    }, [API_BASE_URL, props.academicYear]);

    useEffect(() => {
        Axios.get(API_BASE_URL + '/api/note/' + props.academicYear).then((response) => {
            setNoteList(response.data);
        });
    }, [API_BASE_URL, props.academicYear]);

    useEffect(() => {
        if (null !== noteList) {
            setIsLoading(false);
        }
    }, [noteList]);

    return (

        <div>

            {isLoading ? (
                <h6>&nbsp;&nbsp;Loading...</h6>
            ) : (
                <p>&nbsp;</p>
            )}

            <p className="program-heading" ><b>Academic Year {props.academicYear}</b></p>
            <div className="wrap-collabsible">
                <input id="collapsible7" className="toggle" tabIndex={0} type="checkbox" />
                <label htmlFor="collapsible7" className="lbl-toggle">Master's Degree</label>
                <div className="collapsible-content">
                    <div className="content-inner">
                        <table style={{ width: "100%", tableLayout: "fixed" }} className="degree-table">
                            <thead>
                                <tr>
                                    <th className="th center curriculum">Curriculum</th>
                                    <th className="th center fall">Fall</th>
                                    <th className="th center winter">Winter</th>
                                    <th className="th center spring">Spring</th>
                                    <th className="th center summer">Summer</th>
                                </tr>
                            </thead>
                            <tbody>

                                {
                                    mastersList.map((item) => {

                                        if (item.name !== degreeName) {

                                            degreeName = item.name;
                                            i++;

                                            return (
                                                displayMastersDegreeWithHeader(i, item)
                                            )
                                        } else {
                                            return (
                                                displayMastersDegree(i, item)
                                            )
                                        }
                                    })
                                }

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <p></p>
            <div className="wrap-collabsible">
                <input id="collapsible8" className="toggle" type="checkbox" />
                <label htmlFor="collapsible8" className="lbl-toggle" tabIndex={0}>Stackable Certificates</label>
                <div className="collapsible-content">
                    <div className="content-inner">
                        <table style={{ width: "100%", tableLayout: "fixed" }} className="degree-table">
                            <thead>
                                <tr>
                                    <th className="th center curriculum">Curriculum</th>
                                    <th className="th center fall">Fall</th>
                                    <th className="th center winter">Winter</th>
                                    <th className="th center spring">Spring</th>
                                    <th className="th center summer">Summer</th>
                                </tr>
                            </thead>
                            <tbody>

                                {
                                    certificatesList.map((item) => {

                                        if (item.name !== degreeName) {

                                            degreeName = item.name;
                                            j++;

                                            return (
                                                displayStackableCertificatesWithHeader(j, item)
                                            )
                                        } else {
                                            return (
                                                displayStackableCertificates(j, item)
                                            )
                                        }
                                    })
                                }

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <p></p>
            <div className="wrap-collabsible">
                <input id="collapsible9" className="toggle" type="checkbox" />
                <label htmlFor="collapsible9" className="lbl-toggle" tabIndex={0}>Notes</label>
                <div className="collapsible-content">
                    <div className="content-inner">
                        <table style={{ width: "100%", tableLayout: "fixed" }} className="degree-table">
                            <tbody>
                                <tr>
                                    <td style={{ borderTop: "black solid 1px" }}></td>
                                </tr>
                                {
                                    
                                    noteList.map((item) => {
    
                                            return (
                                                <tr>
                                                    <td className="note-content" style={{ borderBottom: "0" }}>{ item.value }</td>
                                                </tr>
                                            )
                                    })
                                }
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div >
    )
}

export default Schedule3;

function displayMastersDegreeWithHeader(index, item) {

    return (
        <>
            <tr>
                <td className={`masters-degree-${index}`} colSpan={5} style={{ textAlign: "center" }}>{item.name}</td>
            </tr>
            <tr>
                <td className={`masters-degree-${index}`} style={{ textAlign: "right" }}>{item.curriculum}</td>
                <td className="degree-content">{item.fall}</td>
                <td className="degree-content">{item.winter}</td>
                <td className="degree-content">{item.spring}</td>
                <td className="degree-content">{item.summer}</td>
            </tr>
        </>
    )
};

function displayMastersDegree(index, item) {

    return (
        <tr>
            <td className={`masters-degree-${index}`} style={{ textAlign: "right" }}>{item.curriculum}</td>
            <td className="degree-content">{item.fall}</td>
            <td className="degree-content">{item.winter}</td>
            <td className="degree-content">{item.spring}</td>
            <td className="degree-content">{item.summer}</td>
        </tr>
    )
};

function displayStackableCertificatesWithHeader(index, item) {

    return (
        <>
            <tr>
                <td className={`stackable-certificates-${index}`} colSpan={5} style={{ textAlign: "center" }}>{item.name}</td>
            </tr>
            <tr>
                <td className={`stackable-certificates-${index}`} style={{ textAlign: "right" }}>{item.curriculum}</td>
                <td className="degree-content">{item.fall}</td>
                <td className="degree-content">{item.winter}</td>
                <td className="degree-content">{item.spring}</td>
                <td className="degree-content">{item.summer}</td>
            </tr>
        </>
    )
};

function displayStackableCertificates(index, item) {

    return (
        <tr>
            <td className={`stackable-certificates-${index}`} style={{ textAlign: "right" }}>{item.curriculum}</td>
            <td className="degree-content">{item.fall}</td>
            <td className="degree-content">{item.winter}</td>
            <td className="degree-content">{item.spring}</td>
            <td className="degree-content">{item.summer}</td>
        </tr>
    )
};
