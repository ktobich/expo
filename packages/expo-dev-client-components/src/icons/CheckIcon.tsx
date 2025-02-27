import * as React from 'react';

import { Image } from '../Image';

const icon = require('../../assets/check-icon.png');

export function CheckIcon(props: Partial<React.ComponentProps<typeof Image>>) {
  return <Image source={icon} {...props} />;
}
