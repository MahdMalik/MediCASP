'use client';

import React from 'react'
import Image from 'next/image';
import { Container, Box, Typography, AppBar, Toolbar, Button, ThemeProvider, createTheme } from '@mui/material'
import { SignUp, SignIn, SignedIn, SignedOut, UserButton} from '@clerk/nextjs'
import Link from 'next/link'

// Import your logo
import logo from '../../../public/logoV2.png'; // public pathway

// Theme customization based on logo colors
const logoColor = '#39FF14'; // This is green, dominant color in the logo
const theme = createTheme({
  palette: {
    primary: {
      main: '#02023a', // Dark blue, also in the logo
      contrastText: '#fff',  // White text for contrast
    },
    secondary: {
      main: '#00C850',  // Lighter green, also in the logo
      contrastText: '#000', // Black text for contrast
    },
    background: {
      default: '#f5f5f5',
      paper: '#ffffff',
    },
  },
  typography: {
    fontFamily: 'Roboto, sans-serif',
  },
});


// Sign up page component
export default function SignUpPage() {

  return <Container maxWidth="100vw">
   {/* navibar ----------------------------------------------------------------------------------------------*/}
    <ThemeProvider theme={theme}>
      <AppBar position="static">
        <Toolbar style={{ display: 'flex', justifyContent: 'space-between' }}>              
          {/* <Box style={{ display: 'flex', alignItems: 'center' }}> */}
            <Button color="inherit" href="/" sx={{ ml: 2 }}>
              <Image src={logo} alt="MediCASP Logo" width={40} height={40} /><Typography variant="h6" fontWeight="600">
                MediCASP
              </Typography>
            </Button>
          {/* </Box> */}
          <Box style={{ display: 'flex', alignItems: 'center' }}>
            <Button color="inherit" href="/about" sx={{ ml: 2 }}>
              About
            </Button>
              <SignedOut>
                <Button color="inherit" href="/login">{' '}Login</Button>
                <Button color="inherit" href="/sign-up">{' '}Sign Up</Button>
              </SignedOut>
              <SignedIn>
                <UserButton />
              </SignedIn>
          </Box>
        </Toolbar>
      </AppBar>
    </ThemeProvider>
   
    <Box
      display="flex"
      flexDirection="column"
      justifyContent="center"
      alignItems="center"
      sx={{ textAlign: 'center', my: 4 }}
    >
      <Typography variant="h4" component="h1" gutterBottom>
        Sign Up
      </Typography>
      <SignUp />
    </Box></Container>
}