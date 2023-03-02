import { ReactComponent as BookIcon } from './icons/book.svg';
import { ReactComponent as LikeIcon } from './icons/like.svg';
import { ReactComponent as MailIcon } from './icons/mail.svg';
import { ReactComponent as ShirtIcon } from './icons/shirt.svg';
import { ReactComponent as StoreIcon } from './icons/store.svg';
import { ReactComponent as UserIcon } from './icons/user.svg';

interface NavItem {
  label: string;
  to: string;
  icon: typeof BookIcon;
}

export const navItems: NavItem[] = [
  { label: 'navBar.marketplace', to: '/', icon: StoreIcon },
  { label: 'navBar.influencers', to: '/', icon: UserIcon },
  { label: 'navBar.discounts', to: '/', icon: ShirtIcon },
  { label: 'navBar.partnership', to: '/', icon: LikeIcon },
  { label: 'navBar.blog', to: '/', icon: BookIcon },
  { label: 'navBar.contactUs', to: '/', icon: MailIcon },
];
