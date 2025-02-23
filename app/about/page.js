'use client';
import Image from 'next/image';
import React from 'react';
import {
    Box, Typography, Container, Grid, Paper, Stack, TextField, Button, Avatar, AppBar, Toolbar,
    createTheme, ThemeProvider, Fade, IconButton, CircularProgress,
  } from "@mui/material";
import SendIcon from '@mui/icons-material/Send';
  

// Import your logo
import logo from '../../public/logoV2.png'; // public pathway

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

// About page component
const About = () => {
    return (
        <Box sx={{
            minHeight: '100vh',
            bgcolor: '#f5f5f5',
            fontFamily: 'Roboto, sans-serif',
        }}>
            {/* navibar */}
            <ThemeProvider theme={theme}>
            <AppBar position="static">
                <Toolbar>
                <Image src={logo} alt="MediCASP Logo" width={40} height={40} /><Typography variant="h6" fontWeight="600">
                    MediCASP
                </Typography>
                <Button color="inherit" href="/" sx={{ ml: 2 }}>
                    Home
                </Button>
                <Button color="inherit" href="/about" sx={{ ml: 2 }}>
                    About
                </Button>
                </Toolbar>
            </AppBar>
        </ThemeProvider>
            {/* Main Content */}
            <Container maxWidth="md" sx={{ py: 6, spaceY: 6 }}>
                {/* Introduction Card */}
                <Paper elevation={3} sx={{ p: 4 }}>
                    <Typography variant="h4" component="h1" gutterBottom sx={{ color: '#02023a' }}>
                        About MediCASP
                    </Typography>
                    <Typography variant="body1" sx={{ color: 'gray.700' }}>
                        MediCASP is a comprehensive medical support assistant designed to help screen for multiple medical conditions and provide preliminary insights into potential symptoms. Our platform combines advanced AI technology with medical knowledge to offer accessible initial assessments for various health conditions.
                    </Typography>
                </Paper>

                {/* Medical Conditions Card */}
                <Paper elevation={3} sx={{ p: 4 }}>
                    <Typography variant="h5" component="h2" gutterBottom sx={{ color: '#02023a' }}>
                        Medical Conditions We Screen
                    </Typography>
                    <Grid container spacing={3}>
                        <Grid item xs={12} md={6}>
                            <Paper elevation={1} sx={{ p: 3, bgcolor: '#f5f5f5' }}>
                                <Typography variant="h6" sx={{ color: '#00C850' }}>Autism Spectrum Disorder</Typography>
                                <Typography variant="body2" sx={{ color: 'gray.700' }}>Early screening and detection of autism symptoms with detailed assessments.</Typography>
                            </Paper>
                        </Grid>
                        <Grid item xs={12} md={6}>
                            <Paper elevation={1} sx={{ p: 3, bgcolor: '#f5f5f5' }}>
                                <Typography variant="h6" sx={{ color: '#00C850' }}>Dementia</Typography>
                                <Typography variant="body2" sx={{ color: 'gray.700' }}>Cognitive assessment and early warning signs detection for dementia.</Typography>
                            </Paper>
                        </Grid>
                        <Grid item xs={12} md={6}>
                            <Paper elevation={1} sx={{ p: 3, bgcolor: '#f5f5f5' }}>
                                <Typography variant="h6" sx={{ color: '#00C850' }}>Hypertension</Typography>
                                <Typography variant="body2" sx={{ color: 'gray.700' }}>Blood pressure monitoring guidance and risk factor assessment.</Typography>
                            </Paper>
                        </Grid>
                        <Grid item xs={12} md={6}>
                            <Paper elevation={1} sx={{ p: 3, bgcolor: '#f5f5f5' }}>
                                <Typography variant="h6" sx={{ color: '#00C850' }}>Arthritis</Typography>
                                <Typography variant="body2" sx={{ color: 'gray.700' }}>Joint pain assessment and early arthritis symptom screening.</Typography>
                            </Paper>
                        </Grid>
                        <Grid item xs={12}>
                            <Paper elevation={1} sx={{ p: 3, bgcolor: '#f5f5f5' }}>
                                <Typography variant="h6" sx={{ color: '#00C850' }}>Diabetes</Typography>
                                <Typography variant="body2" sx={{ color: 'gray.700' }}>Blood sugar management guidance and diabetes risk assessment.</Typography>
                            </Paper>
                        </Grid>
                    </Grid>
                </Paper>

                {/* Purpose Card */}
                <Paper elevation={3} sx={{ p: 4 }}>
                    <Typography variant="h5" component="h2" gutterBottom sx={{ color: '#02023a' }}>
                        Our Purpose
                    </Typography>
                    <Typography variant="body1" sx={{ color: 'gray.700' }}>
                        We aim to make preliminary medical screening more accessible and less intimidating. Our chatbot provides a comfortable, private environment for users to discuss their concerns and receive initial guidance about potential symptoms across multiple conditions.
                    </Typography>
                    <Typography variant="body1" sx={{ color: 'gray.700', mt: 2 }}>
                        While our AI assistant can provide valuable insights, it's important to note that it does not replace professional medical diagnosis. We encourage users to seek professional medical evaluation for proper diagnosis and treatment.
                    </Typography>
                </Paper>

                {/* Features Card */}
                <Paper elevation={3} sx={{ p: 4 }}>
                    <Typography variant="h5" component="h2" gutterBottom sx={{ color: '#02023a' }}>
                        Key Features
                    </Typography>
                    <Typography variant="body1" component="ul" sx={{ pl: 3, color: 'gray.700' }}>
                        <Typography component="li">Interactive chat interface for easy communication</Typography>
                        <Typography component="li">Comprehensive screening for multiple medical conditions</Typography>
                        <Typography component="li">Detailed symptom assessment and guidance</Typography>
                        <Typography component="li">Quick-reply options for common queries</Typography>
                        <Typography component="li">Educational resources about various medical conditions</Typography>
                        <Typography component="li">Real-time risk assessment and monitoring recommendations</Typography>
                    </Typography>
                </Paper>

                {/* Disclaimer Card */}
                <Paper elevation={3} sx={{ p: 4, textAlign: 'center' }}>
                    <Typography variant="h6" sx={{ color: '#00C850', fontStyle: 'italic' }}>
                        Important Disclaimer
                    </Typography>
                    <Typography variant="body1" sx={{ color: 'gray.700', fontStyle: 'italic' }}>
                        MediCASP Bot is designed to provide insights into potential medical conditions, but it does not replace a real doctor! Always consult with qualified healthcare professionals for proper medical diagnosis and treatment. Our service is intended for preliminary screening and educational purposes only.
                    </Typography>
                </Paper>
            </Container>
        </Box>
    );
};

export default About;
