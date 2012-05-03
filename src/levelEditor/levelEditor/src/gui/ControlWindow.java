package gui;

import java.awt.EventQueue;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.UIManager;

import oiFactory.IoEngine;
import engine.JsonEngine;
import engine.Statics;
import javax.swing.JTextArea;
import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;

public class ControlWindow {

	private JFrame frmLevelEditor;
	private JTextField locationField;
	private JTextField levelNumberField;
	private JTextArea txtrBlastedEngineLevel;
	
	IoEngine ioEngine;
	JsonEngine jsonEngine;
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					try {
						  UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
						} catch(Exception e) {
						  System.out.println("Error setting native LAF: " + e);
						}
					ControlWindow window = new ControlWindow();
					window.frmLevelEditor.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public ControlWindow() {
		initialize();
		
		//Setup the modules
		ioEngine = new IoEngine(this);
		jsonEngine = new JsonEngine(this, ioEngine);
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmLevelEditor = new JFrame();
		frmLevelEditor.setTitle("Level Editor");
		frmLevelEditor.setBounds(100, 100, 450, 335);
		frmLevelEditor.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmLevelEditor.getContentPane().setLayout(null);
		
		locationField = new JTextField();
		locationField.setBounds(95, 6, 314, 20);
		frmLevelEditor.getContentPane().add(locationField);
		locationField.setColumns(10);
		locationField.setText(Statics.DEFAULT_LOCATION);
		
		JLabel lblLocation = new JLabel("Location:");
		lblLocation.setBounds(39, 9, 46, 14);
		frmLevelEditor.getContentPane().add(lblLocation);
		
		levelNumberField = new JTextField();
		levelNumberField.setBounds(276, 38, 132, 20);
		frmLevelEditor.getContentPane().add(levelNumberField);
		levelNumberField.setColumns(10);
		levelNumberField.setText(Statics.DEFAULT_LEVEL);
		
		JLabel lblLevelNumber = new JLabel("Level Number:");
		lblLevelNumber.setBounds(195, 41, 71, 14);
		frmLevelEditor.getContentPane().add(lblLevelNumber);
		
		JButton buildAllButton = new JButton("Build All");
		buildAllButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				createOutput();
			}
		});
		buildAllButton.setBounds(39, 71, 370, 62);
		frmLevelEditor.getContentPane().add(buildAllButton);
		
		JButton createTemplateButton = new JButton("Create Template");
		createTemplateButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {			
				createNewFile();
			}
		});
		createTemplateButton.setBounds(39, 37, 146, 23);
		frmLevelEditor.getContentPane().add(createTemplateButton);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPane.setBounds(39, 144, 370, 142);
		frmLevelEditor.getContentPane().add(scrollPane);
		
		txtrBlastedEngineLevel = new JTextArea();
		scrollPane.setViewportView(txtrBlastedEngineLevel);
		txtrBlastedEngineLevel.setEditable(false);
		txtrBlastedEngineLevel.setText("Blasted Engine level editor..\n");
	}
	
	public void updateAudit(String message)
	{
		txtrBlastedEngineLevel.append(message + "\n");
	}
	
	private void createNewFile()
	{
		System.out.println("new template");
		try {
			ioEngine.createTemplate(levelNumberField.getText(), locationField.getText());
		} catch (IOException e) {
			System.out.println("IO ERROR...");
			e.printStackTrace();
		}
	}
	
	private void createOutput()
	{
		System.out.println("Creating output");
		jsonEngine.parseAndOutput(locationField.getText());
	}
}
