import { useEffect, useState } from "react";
import axios from 'axios'

const AuthorsList = () => {
  const [authors, setAuthors] = useState([]);
  useEffect(() => {
    getAuthors();
  }, []);

  const renderAuthors = () => {
    return authors.map((a) => {
      return (
        <div className="component">
          <p>{a.name}</p>
          <p></p>
        </div>
      );
    });
  };

  const getAuthors = async () => {
    try {
      let res = await axios.get("/api/authors");
      setAuthors(res.data);
    } catch (err) {
      alert("err getAuthors occured");
    }
  };
  return (
    <div>
      <h1>AuthorsList</h1>
      {renderAuthors()}
    </div>
  );
};

export default AuthorsList;