type Props = { children: React.ReactNode; type: "submit" | "button" };
export type Ref = HTMLButtonElement;
export const FancyButton = React.forwardRef<Ref, Props>((props, ref) => (
  <button ref={ref} className="MyClassName" type={props.type}>
    {props.children}
  </button>
));


type Props = { children: React.ReactNode; type: "submit" | "button" };
export type Ref = HTMLButtonElement;
export const FancyButton = React.forwardRef((
  props: Props,
  ref: React.Ref<Ref> // <-- here!
) => (
  <button ref={ref} className="MyClassName" type={props.type}>
    {props.children}
  </button>
));

You can make it immutable if you have to - assign React.Ref


// this is a higher-order-function that returns a function
function add(x: number): (y: number) => number {
    // A function is returned here as closure
    // variable x is obtained from the outer scope of this method and memorized in the closure
    return (y: number): number => x + y;
}

// we are currying the add method to create more variations
var add10 = add(10);
var add20 = add(20);
var add30 = add(30);

console.log(add10(5)); // 15
console.log(add20(5)); // 25
console.log(add30(5)); // 35

type Callback = (n: number) => void;
function cb(){

}

const func: (num: number) => string = (num: number) => console.log(num);
const func: (num: number) => string = (num: number) => String(num);


function fillArray<T>(len: number, elem: T) {
  return new Array<T>(len).fill(elem);
}



update a property in an array of objects
setUserList((prev) => {
        return prev.map((a) => {
          return a.id === updatedRoles.id
            ? { ...a, roles: updatedRoles.roles }
            : a;
        });



Type mapping over children
        {React.Children.map<ReactNode, ReactNode>(mainMenu, (child) => {
    const menu = child as ReactElement<PropsWithChildren<SidebarProps>>;
    const props = menu.props.navItems.map((prop) => {
        return {
          ...prop,
          ...(prop.href ? { onClick: closeMenu } : ''),
        };
      });
        if (isValidElement(child)) {
          return cloneElement(child, {
            ...menu.props,
            navItems: [...props],
          });
        }
      })}



Handle click event
      useEffect(() => {
    const sidebar = document.getElementById('dotSidebar') as HTMLDivElement;
    sidebar.addEventListener('mousedown', (e: Event) => {
      if (sidebar.contains(e.target as HTMLElement)) {
        if ((e.target as HTMLElement).getAttribute('href')) {
          setIsOpen(false)
        }
      }
    });
    setIsOpen(open);
  }, [open]);




  import React, {
  createContext,
  useMemo,
  ReactNode,
  useState,
  useContext,
} from 'react';
import { DotSnackbarContainer } from './DotSnackbarContainer';

const initialState = [
  { message: '', open: false, severity: 'success', id: '' },
];

interface DotSnackbarProviderProps {
  children: ReactNode;
}

type Severity = 'success' | 'warning' | 'info' | 'error';

interface DotSnackbarProps {
  alerts: typeof initialState;
  enqueueMessage: (message: string, severity: Severity) => void;
  removeMessage: (id: string) => void;
}

const DotSnackbarContext = createContext<DotSnackbarProps>({
  alerts: [],
  enqueueMessage: (message: string, severity: Severity) => null,
  removeMessage: (id: string) => null,
});

export const DotSnackbarProvider = ({ children }: DotSnackbarProviderProps) => {
  const [alerts, setAlerts] = useState<typeof initialState>([]);

  function enqueueMessage(message: string, severity: Severity): void {
    const queue = { id, message, severity, open: true };

    setAlerts((prevState) => {
      return [...prevState, { ...queue }];
    });
  }

  const removeMessage = (id: string) => {
    setAlerts((prev) => {
      return prev.map((a) => {
        return a.id === id ? { ...a, open: false } : a;
      });
    });
  };

  const DotSnackbarValues = {
    alerts,
    enqueueMessage,
    removeMessage,
  };

  const memoizedValues = useMemo(() => DotSnackbarValues, [alerts]);

  return (
    <DotSnackbarContext.Provider value={memoizedValues}>
      <DotSnackbarContainer />
      {children}
    </DotSnackbarContext.Provider>
  );
};

export const useDotSnackbarContext = () => {
  return useContext(DotSnackbarContext);
};




Handle a click event with curry function
function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {
    return function (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) {
      setInput(oldValues => ({
        ...oldValues,
        fields: {
          ...oldValues.fields,
          [type]: e.target.value,
        },
      }));
    };
  }