import React from "react";
import {gql} from "apollo-boost";
import {useQuery} from "react-apollo";
import { Link, Switch, Route, useParams, useRouteMatch } from "react-router-dom";

interface Poem {
  id: string;
  title: string;
  author: string;
  text: string;
  comments?: Comment[];
};

interface Comment {
  id: string;
  body: string;
  userId: string;
}

interface PoemsQueryResult {
  poems: Poem[];
}

const Poems = () => {
  let match = useRouteMatch();
  console.log("HIYA")

  console.log(match)

  return <div>
    <Switch>
      <Route path={`${match.path}/:poemId`}>
        <Poem />
      </Route>
      <Route exact path={match.path}>
        <PoemsList />
      </Route>
    </Switch>
  </div>
};

const Poem = () => {
  let { poemId } = useParams();

  console.log("BLAH")
  interface WrappedPoem {
    getPoemById: Poem;
  }

  const {data, loading, error} = useQuery<WrappedPoem>(gql`
    {
      getPoemById(poemId: "${poemId}") {
        id
        author
        title
        text
        comments {
          id
          body
          userId
        }
      }
    }
  `)
  
  if (loading) {
    return <h4>Please wait</h4>
  }

  const poem: Poem = data['getPoemById'];

  return <div>
    <h2>{poem.title}</h2>
    <span>by <b>{poem.author}</b></span>
    <p>
      {poem.text}
    </p>
    <ul>
      {poem?.comments ? poem.comments.map(comment => (
        <li key={comment.id}>{comment.body}</li>
      )) : null
      }
    </ul>
  </div>
}

const PoemsList = () => {
  const {data, loading, error} = useQuery<PoemsQueryResult>(gql`
    {
      poems {
        id
        title
        author
        text
      }
    }
  `)

  return <div>
    <h2>Poems</h2>
    <h3>Please select a Poem</h3>
    <ul>
      {data?.poems ? data.poems.map(poem => (
        <Link to={`/poems/${poem.id}`}>
          <li key={poem.id}>{poem.author} -- {poem.title}</li>
        </Link>
      )) : null
      }
    </ul>

  </div>


}

export default Poems;