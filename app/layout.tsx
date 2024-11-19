"use client";

import { defineChain } from "viem";
import { Outfit } from "next/font/google";
import "./globals.css";

import { PrivyProvider } from "@privy-io/react-auth";

const font = Outfit({ subsets: ["latin"] });

const SepoliaChain = defineChain({
  name: "Sepolia",
  id: 11155111,
  network: "testnet",
  nativeCurrency: {
    decimals: 18,
    symbol: "SEP",
    name: "Sepolia",
  },
  rpcUrls: {
    default: {
      http: ["https://sepolia.infura.io"],
    },
  } as any,
  blockExplorerUrls: {
    default: {
      name: "Etherscan",
      url: "https://sepolia.etherscan.io",
    },
  },
});

interface RootLayoutProps {
  children: React.ReactNode;
}

export default function RootLayout({ children }: RootLayoutProps) {
  return (
    <html lang="en">
      <body className={font.className}>
        <PrivyProvider
          appId={process.env.NEXT_PUBLIC_PRIVY_APP_ID as string}
          config={{
            appearance: {
              theme: "light",
              accentColor: "#676FFF",
              logo: "https://your-logo-url",
            },
            embeddedWallets: {
              createOnLogin: "users-without-wallets",
            },
            defaultChain: SepoliaChain,
            supportedChains: [SepoliaChain],
          }}
        >
          {children}
        </PrivyProvider>
      </body>
    </html>
  );
}
