import React from 'react';
import {
  MessageCircle as Comment,
  RefreshCw as Retweet,
  Share,
  Trash2 as Trash,
} from 'react-feather';
import { Link } from '@reach/router';
import Avatar from './Avatar';
import Date from './Date';
import { Markup } from 'interweave';
import { Wrapper, Content, DisplayName, Info, StyledLink, Message, Actions, Button, Spacer} from './TweetStyle';
import {deleteTweetMutation, allTweetsQuery, userQuery, createTweetMutation} from '../queries';
import { useMutation } from '@apollo/react-hooks';

const Tweet = ({ me, loading, tweet }) => {
  const canDelete = tweet.from.id === me.id;
  
  const [deleteTweet] = useMutation(deleteTweetMutation, {
    variables: { id: tweet.id },
    refetchQueries: [
      { query: allTweetsQuery },
      {
        query: userQuery,
        variables: { username: tweet.from.username },
      },
    ],
    awaitRefetchQueries: true,
  });
  
  const [reTweet] = useMutation(createTweetMutation, {
    variables: { tweet: `[Re-tweet from <a href="/${tweet.from.username}">@${tweet.from.username}</a>] ${tweet.tweet}`, from: me.username },
    refetchQueries: [
      { query: allTweetsQuery },
      { query: userQuery, variables: { username: me.username } },
    ],
    awaitRefetchQueries: true,
  });
  
  return (
    <Wrapper>
      <Link to={`/${tweet.from.username}`}>
        <Avatar src={tweet.from.photo} alt={`@${tweet.from.username}`} />
      </Link>
      <Content>
        <Info>
          <StyledLink to={`/${tweet.from.username}`}>
            <DisplayName>{tweet.from.displayName}</DisplayName> @
            {tweet.from.username}
          </StyledLink>{' '}
          • <Date date={tweet.createdAt} />
        </Info>
        <Message><Markup content={tweet.tweet}/></Message>
        <Actions>
          <Button disabled>
            <Comment />
          </Button>
          <Button disabled={loading}
              onClick={() => {
                if (window.confirm('Are you sure?')) {
                  reTweet();
                }
              }}
            >
            <Retweet />
          </Button>
          <Button disabled>
            <Share />
          </Button>
          {canDelete ? (
            <Button
              disabled={loading}
              onClick={() => {
                if (window.confirm('Are you sure?')) {
                  deleteTweet();
                }
              }}
            >
              <Trash />
            </Button>
          ) : (
            <Spacer />
          )}
        </Actions>
      </Content>
    </Wrapper>
  );
};

export default Tweet;
